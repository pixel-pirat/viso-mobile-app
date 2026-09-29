import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// How long since the last heartbeat before a user is considered offline.
const onlineWindow = Duration(seconds: 90);

bool isWithinOnlineWindow(DateTime? lastActiveAt) {
  return lastActiveAt != null &&
      DateTime.now().toUtc().difference(lastActiveAt) < onlineWindow;
}

/// Looks up whether [userId] is currently online.
Future<bool> isUserOnline(final Session session, final UuidValue userId) async {
  final row = await UserPresence.db.findFirstRow(
    session,
    where: (final t) => t.authUserId.equals(userId),
  );
  return isWithinOnlineWindow(row?.lastActiveAt);
}
