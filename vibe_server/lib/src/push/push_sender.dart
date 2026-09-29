import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

const _fcmScope = 'https://www.googleapis.com/auth/firebase.messaging';

/// Sends real push notifications via Firebase Cloud Messaging (HTTP v1 API).
///
/// Requires the `firebaseServiceAccountJson` password (see
/// config/passwords.yaml / the SERVERPOD_PASSWORD_firebaseServiceAccountJson
/// env var in production) to be configured. If it isn't, [sendToUser] simply
/// does nothing — device tokens still register fine, they just won't
/// receive anything until a key is provided.
class PushSender {
  static AutoRefreshingAuthClient? _client;
  static String? _projectId;
  static Future<void>? _initFuture;

  static Future<void> _ensureClient(final Session session) {
    return _initFuture ??= () async {
      final json = session.passwords['firebaseServiceAccountJson'];
      if (json == null) return;

      final credentials = ServiceAccountCredentials.fromJson(json);
      _projectId = credentials.projectId;
      _client = await clientViaServiceAccount(credentials, [_fcmScope]);
    }();
  }

  /// Sends a push notification to every device registered to [userId].
  /// Silently does nothing if no credentials are configured, and never
  /// throws — a failed push shouldn't fail the action that triggered it
  /// (e.g. sending a chat message).
  static Future<void> sendToUser(
    final Session session,
    final UuidValue userId, {
    required final String title,
    required final String body,
    final Map<String, String>? data,
  }) async {
    try {
      await _ensureClient(session);
      final client = _client;
      final projectId = _projectId;
      if (client == null || projectId == null) return;

      final tokens = await DeviceToken.db.find(
        session,
        where: (final t) => t.authUserId.equals(userId),
      );
      if (tokens.isEmpty) return;

      final staleTokens = <String>[];

      for (final deviceToken in tokens) {
        final response = await client.post(
          Uri.parse(
            'https://fcm.googleapis.com/v1/projects/$projectId/messages:send',
          ),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'message': {
              'token': deviceToken.token,
              'notification': {'title': title, 'body': body},
              'data': ?data,
            },
          }),
        );

        if (response.statusCode == 404 || response.statusCode == 400) {
          // Token is invalid/unregistered — stop sending to it.
          staleTokens.add(deviceToken.token);
        } else if (response.statusCode >= 300) {
          session.log(
            '[PushSender] FCM send failed (${response.statusCode}): '
            '${response.body}',
            level: LogLevel.warning,
          );
        }
      }

      if (staleTokens.isNotEmpty) {
        await DeviceToken.db.deleteWhere(
          session,
          where: (final t) => t.token.inSet(staleTokens.toSet()),
        );
      }
    } catch (e, stackTrace) {
      session.log(
        '[PushSender] Failed to send push notification',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
    }
  }
}
