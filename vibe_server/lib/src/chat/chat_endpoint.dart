import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../generated/protocol.dart';

/// Real direct-messaging between signed-in users: conversation list,
/// message history, sending, read receipts and finding people to message.
class ChatEndpoint extends Endpoint {
  final UserProfiles _userProfiles = const UserProfiles();

  @override
  bool get requireLogin => true;

  /// Returns up to 20 real users whose name or username matches [query],
  /// excluding the signed-in user. Used by the "New Message" flow.
  Future<List<UserProfileModel>> searchUsers(
    final Session session,
    final String query,
  ) async {
    final myId = session.authenticated!.authUserId;
    final trimmed = query.trim();
    if (trimmed.length < 2) return [];

    final pattern = '%$trimmed%';
    final rows = await UserProfile.db.find(
      session,
      where: (final t) =>
          (t.userName.ilike(pattern) | t.fullName.ilike(pattern)) &
          t.authUserId.notEquals(myId),
      limit: 20,
    );

    return rows.map((final r) => r.toModel()).toList();
  }

  /// Returns the signed-in user's conversations, most recent first.
  Future<List<ChatConversationSummary>> listConversations(
    final Session session,
  ) async {
    final myId = session.authenticated!.authUserId;

    final messages = await ChatMessage.db.find(
      session,
      where: (final t) => t.senderId.equals(myId) | t.recipientId.equals(myId),
      orderBy: (final t) => t.createdAt,
      orderDescending: true,
      limit: 500,
    );

    final lastMessageByPartner = <UuidValue, ChatMessage>{};
    final unreadCountByPartner = <UuidValue, int>{};

    for (final message in messages) {
      final isMine = message.senderId == myId;
      final partnerId = isMine ? message.recipientId : message.senderId;

      lastMessageByPartner.putIfAbsent(partnerId, () => message);

      if (!isMine && message.readAt == null) {
        unreadCountByPartner[partnerId] =
            (unreadCountByPartner[partnerId] ?? 0) + 1;
      }
    }

    final summaries = <ChatConversationSummary>[];
    for (final entry in lastMessageByPartner.entries) {
      final partnerId = entry.key;
      final lastMessage = entry.value;
      final profile = await _userProfiles.maybeFindUserProfileByUserId(
        session,
        partnerId,
      );

      summaries.add(
        ChatConversationSummary(
          partnerId: partnerId,
          partnerName:
              profile?.fullName ??
              profile?.userName ??
              profile?.email?.split('@').first ??
              'Unknown user',
          partnerUserName: profile?.userName,
          partnerAvatarUrl: profile?.imageUrl?.toString(),
          lastMessageText: lastMessage.text,
          lastMessageAt: lastMessage.createdAt,
          lastMessageIsMine: lastMessage.senderId == myId,
          unreadCount: unreadCountByPartner[partnerId] ?? 0,
        ),
      );
    }

    summaries.sort(
      (final a, final b) => b.lastMessageAt.compareTo(a.lastMessageAt),
    );
    return summaries;
  }

  /// Returns the message history with [partnerId], oldest first.
  Future<List<ChatMessage>> getMessages(
    final Session session,
    final UuidValue partnerId, {
    final int limit = 100,
  }) async {
    final myId = session.authenticated!.authUserId;

    final messages = await ChatMessage.db.find(
      session,
      where: (final t) =>
          (t.senderId.equals(myId) & t.recipientId.equals(partnerId)) |
          (t.senderId.equals(partnerId) & t.recipientId.equals(myId)),
      orderBy: (final t) => t.createdAt,
      orderDescending: true,
      limit: limit,
    );

    return messages.reversed.toList();
  }

  /// Sends a text message to [recipientId].
  Future<ChatMessage> sendMessage(
    final Session session,
    final UuidValue recipientId,
    final String text,
  ) async {
    final myId = session.authenticated!.authUserId;
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('Message text cannot be empty.');
    }
    if (recipientId == myId) {
      throw ArgumentError('Cannot send a message to yourself.');
    }

    return ChatMessage.db.insertRow(
      session,
      ChatMessage(senderId: myId, recipientId: recipientId, text: trimmed),
    );
  }

  /// Marks all messages from [partnerId] to the signed-in user as read.
  Future<void> markConversationRead(
    final Session session,
    final UuidValue partnerId,
  ) async {
    final myId = session.authenticated!.authUserId;

    final unread = await ChatMessage.db.find(
      session,
      where: (final t) =>
          t.senderId.equals(partnerId) &
          t.recipientId.equals(myId) &
          t.readAt.equals(null),
    );

    final now = DateTime.now().toUtc();
    for (final message in unread) {
      message.readAt = now;
    }
    if (unread.isNotEmpty) {
      await ChatMessage.db.update(session, unread);
    }
  }
}
