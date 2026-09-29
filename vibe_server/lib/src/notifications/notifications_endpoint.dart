import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../generated/protocol.dart';
import '../push/push_sender.dart';

/// Real, database-backed notifications for the signed-in user.
class NotificationsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Returns the signed-in user's notifications, most recent first.
  Future<List<AppNotification>> list(final Session session) async {
    final myId = session.authenticated!.authUserId;
    return AppNotification.db.find(
      session,
      where: (final t) => t.recipientId.equals(myId),
      orderBy: (final t) => t.createdAt,
      orderDescending: true,
      limit: 100,
    );
  }

  /// Marks a single notification as read.
  Future<void> markRead(final Session session, final int notificationId) async {
    final myId = session.authenticated!.authUserId;
    final row = await AppNotification.db.findById(session, notificationId);
    if (row == null || row.recipientId != myId) return;

    row.readAt = DateTime.now().toUtc();
    await AppNotification.db.updateRow(session, row);
  }

  /// Marks all of the signed-in user's notifications as read.
  Future<void> markAllRead(final Session session) async {
    final myId = session.authenticated!.authUserId;
    final unread = await AppNotification.db.find(
      session,
      where: (final t) => t.recipientId.equals(myId) & t.readAt.equals(null),
    );

    final now = DateTime.now().toUtc();
    for (final row in unread) {
      row.readAt = now;
    }
    if (unread.isNotEmpty) {
      await AppNotification.db.update(session, unread);
    }
  }

  /// Creates a notification the signed-in user sends to themself, to
  /// confirm the notifications pipeline is working end to end.
  Future<AppNotification> sendTestNotification(final Session session) async {
    final myId = session.authenticated!.authUserId;
    const title = 'Test notification';
    const body = 'If you can see this, notifications are working.';

    final notification = await AppNotification.db.insertRow(
      session,
      AppNotification(
        recipientId: myId,
        type: 'test',
        title: title,
        body: body,
      ),
    );

    await PushSender.sendToUser(session, myId, title: title, body: body);

    return notification;
  }
}
