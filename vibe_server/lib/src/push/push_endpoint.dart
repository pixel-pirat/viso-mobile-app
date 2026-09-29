import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../generated/protocol.dart';

/// Registers/unregisters this device's Firebase Cloud Messaging token so
/// the server can send it push notifications (e.g. for new chat messages).
class PushEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Registers or refreshes [token] for the signed-in user's device.
  Future<void> registerDeviceToken(
    final Session session,
    final String token,
    final String platform,
  ) async {
    final myId = session.authenticated!.authUserId;

    final existing = await DeviceToken.db.findFirstRow(
      session,
      where: (final t) => t.token.equals(token),
    );

    if (existing != null) {
      existing
        ..authUserId = myId
        ..platform = platform
        ..updatedAt = DateTime.now().toUtc();
      await DeviceToken.db.updateRow(session, existing);
      return;
    }

    await DeviceToken.db.insertRow(
      session,
      DeviceToken(authUserId: myId, token: token, platform: platform),
    );
  }

  /// Removes [token], e.g. on sign-out, so this device stops receiving
  /// pushes for the account that was signed in.
  Future<void> unregisterDeviceToken(
    final Session session,
    final String token,
  ) async {
    await DeviceToken.db.deleteWhere(
      session,
      where: (final t) => t.token.equals(token),
    );
  }
}
