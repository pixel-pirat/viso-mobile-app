import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../generated/protocol.dart';
import 'presence_util.dart';

/// Tracks and reports whether users are currently online, based on a
/// periodic heartbeat call from the app while it's in the foreground.
class PresenceEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Marks the signed-in user as active right now. Call this periodically
  /// (e.g. every 30s) while the app is in the foreground.
  Future<void> heartbeat(final Session session) async {
    final myId = session.authenticated!.authUserId;
    final now = DateTime.now().toUtc();

    final existing = await UserPresence.db.findFirstRow(
      session,
      where: (final t) => t.authUserId.equals(myId),
    );

    if (existing != null) {
      existing.lastActiveAt = now;
      await UserPresence.db.updateRow(session, existing);
    } else {
      await UserPresence.db.insertRow(
        session,
        UserPresence(authUserId: myId, lastActiveAt: now),
      );
    }
  }

  /// Returns whether [userId] is currently online.
  Future<PresenceStatus> getPresence(
    final Session session,
    final UuidValue userId,
  ) async {
    final row = await UserPresence.db.findFirstRow(
      session,
      where: (final t) => t.authUserId.equals(userId),
    );

    final lastActiveAt = row?.lastActiveAt;
    return PresenceStatus(
      isOnline: isWithinOnlineWindow(lastActiveAt),
      lastActiveAt: lastActiveAt,
    );
  }
}
