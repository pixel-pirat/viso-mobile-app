import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../generated/protocol.dart';
import '../presence/presence_util.dart';
import '../push/push_sender.dart';

/// Real direct-messaging between signed-in users: conversation list,
/// message history, sending (text/media/replies), reactions, edits,
/// deletes, forwarding, read/delivered receipts and finding people to
/// message.
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
      final hiddenAt = isMine
          ? message.hiddenForSender
          : message.hiddenForRecipient;

      if (hiddenAt == null) {
        lastMessageByPartner.putIfAbsent(partnerId, () => message);
      }

      if (!isMine &&
          message.readAt == null &&
          message.hiddenForRecipient == null) {
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
      final isOnline = await isUserOnline(session, partnerId);
      final isDeleted = lastMessage.deletedAt != null;
      final previewText = isDeleted
          ? 'This message was deleted'
          : (lastMessage.text.isNotEmpty
                ? lastMessage.text
                : _mediaLabel(lastMessage.mediaType));

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
          lastMessageText: previewText,
          lastMessageMediaType: isDeleted ? null : lastMessage.mediaType,
          lastMessageAt: lastMessage.createdAt,
          lastMessageIsMine: lastMessage.senderId == myId,
          unreadCount: unreadCountByPartner[partnerId] ?? 0,
          partnerIsOnline: isOnline,
        ),
      );
    }

    summaries.sort(
      (final a, final b) => b.lastMessageAt.compareTo(a.lastMessageAt),
    );
    return summaries;
  }

  /// Returns the message history with [partnerId], oldest first, with
  /// media, reply previews and reactions resolved. Also opportunistically
  /// marks any of the partner's messages as delivered.
  Future<List<ChatMessageView>> getMessages(
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

    final visible = messages.where((final m) {
      final hiddenAt = m.senderId == myId
          ? m.hiddenForSender
          : m.hiddenForRecipient;
      return hiddenAt == null;
    }).toList();

    final toMarkDelivered = visible
        .where((final m) => m.recipientId == myId && m.deliveredAt == null)
        .toList();
    if (toMarkDelivered.isNotEmpty) {
      final now = DateTime.now().toUtc();
      for (final m in toMarkDelivered) {
        m.deliveredAt = now;
      }
      await ChatMessage.db.update(session, toMarkDelivered);
    }

    return _toViews(session, visible.reversed.toList(), myId);
  }

  /// Sends a message to [recipientId]. [mediaUrl]/[mediaType] should
  /// already be uploaded via [MediaEndpoint.upload]. A message needs text
  /// or an attachment (or both, e.g. a captioned photo).
  Future<ChatMessageView> sendMessage(
    final Session session,
    final UuidValue recipientId,
    final String text, {
    final String? mediaUrl,
    final String? mediaType,
    final int? replyToMessageId,
  }) async {
    final myId = session.authenticated!.authUserId;
    final trimmed = text.trim();
    if (trimmed.isEmpty && mediaUrl == null) {
      throw ArgumentError('A message needs text or an attachment.');
    }
    if (recipientId == myId) {
      throw ArgumentError('Cannot send a message to yourself.');
    }

    final message = await ChatMessage.db.insertRow(
      session,
      ChatMessage(
        senderId: myId,
        recipientId: recipientId,
        text: trimmed,
        mediaUrl: mediaUrl,
        mediaType: mediaUrl != null ? mediaType : null,
        replyToMessageId: replyToMessageId,
      ),
    );

    final senderProfile = await _userProfiles.maybeFindUserProfileByUserId(
      session,
      myId,
    );
    final senderName =
        senderProfile?.fullName ??
        senderProfile?.userName ??
        senderProfile?.email?.split('@').first ??
        'Someone';
    final notificationBody = trimmed.isNotEmpty
        ? trimmed
        : _mediaLabel(mediaType);

    await AppNotification.db.insertRow(
      session,
      AppNotification(
        recipientId: recipientId,
        type: 'message',
        title: senderName,
        body: notificationBody,
        relatedUserId: myId,
        relatedUserName: senderName,
        relatedUserAvatarUrl: senderProfile?.imageUrl?.toString(),
      ),
    );

    // Best-effort; never blocks sending the message itself.
    unawaited(
      PushSender.sendToUser(
        session,
        recipientId,
        title: senderName,
        body: notificationBody,
        data: {'type': 'message', 'senderId': myId.toString()},
      ),
    );

    final views = await _toViews(session, [message], myId);
    return views.first;
  }

  /// Re-sends [messageId]'s content (text/media) to [toRecipientId].
  Future<ChatMessageView> forwardMessage(
    final Session session,
    final int messageId,
    final UuidValue toRecipientId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final original = await ChatMessage.db.findById(session, messageId);
    if (original == null) throw ArgumentError('Message not found.');
    if (original.senderId != myId && original.recipientId != myId) {
      throw ArgumentError('Not part of this conversation.');
    }
    if (original.deletedAt != null) {
      throw ArgumentError('Cannot forward a deleted message.');
    }

    return sendMessage(
      session,
      toRecipientId,
      original.text,
      mediaUrl: original.mediaUrl,
      mediaType: original.mediaType,
    );
  }

  /// Edits the text of a message the signed-in user sent.
  Future<ChatMessageView> editMessage(
    final Session session,
    final int messageId,
    final String newText,
  ) async {
    final myId = session.authenticated!.authUserId;
    final trimmed = newText.trim();
    if (trimmed.isEmpty) throw ArgumentError('Message text cannot be empty.');

    final message = await ChatMessage.db.findById(session, messageId);
    if (message == null) throw ArgumentError('Message not found.');
    if (message.senderId != myId) {
      throw ArgumentError('You can only edit your own messages.');
    }
    if (message.deletedAt != null) {
      throw ArgumentError('Cannot edit a deleted message.');
    }

    message.text = trimmed;
    message.editedAt = DateTime.now().toUtc();
    await ChatMessage.db.updateRow(session, message);

    final views = await _toViews(session, [message], myId);
    return views.first;
  }

  /// Deletes a message for everyone — only the sender can do this. Clears
  /// the content; the client renders a "message deleted" placeholder.
  Future<void> deleteMessageForEveryone(
    final Session session,
    final int messageId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final message = await ChatMessage.db.findById(session, messageId);
    if (message == null) return;
    if (message.senderId != myId) {
      throw ArgumentError(
        'You can only delete your own messages for everyone.',
      );
    }

    message.deletedAt = DateTime.now().toUtc();
    message.text = '';
    message.mediaUrl = null;
    message.mediaType = null;
    await ChatMessage.db.updateRow(session, message);
  }

  /// Hides a message from the signed-in user's view only; the other party
  /// still sees it normally.
  Future<void> deleteMessageForMe(
    final Session session,
    final int messageId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final message = await ChatMessage.db.findById(session, messageId);
    if (message == null) return;

    final now = DateTime.now().toUtc();
    if (message.senderId == myId) {
      message.hiddenForSender = now;
    } else if (message.recipientId == myId) {
      message.hiddenForRecipient = now;
    } else {
      return;
    }
    await ChatMessage.db.updateRow(session, message);
  }

  /// Sets the signed-in user's reaction on a message to [emoji]. Reacting
  /// with the same emoji again removes it; a different emoji replaces it.
  Future<void> reactToMessage(
    final Session session,
    final int messageId,
    final String emoji,
  ) async {
    final myId = session.authenticated!.authUserId;

    final message = await ChatMessage.db.findById(session, messageId);
    if (message == null) throw ArgumentError('Message not found.');
    if (message.senderId != myId && message.recipientId != myId) {
      throw ArgumentError('Not part of this conversation.');
    }

    final existing = await MessageReaction.db.findFirstRow(
      session,
      where: (final t) => t.messageId.equals(messageId) & t.userId.equals(myId),
    );

    if (existing != null) {
      if (existing.emoji == emoji) {
        await MessageReaction.db.deleteRow(session, existing);
      } else {
        existing.emoji = emoji;
        await MessageReaction.db.updateRow(session, existing);
      }
    } else {
      await MessageReaction.db.insertRow(
        session,
        MessageReaction(messageId: messageId, userId: myId, emoji: emoji),
      );
    }
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

  String _mediaLabel(final String? mediaType) {
    switch (mediaType) {
      case 'image':
        return '📷 Photo';
      case 'video':
        return '🎥 Video';
      case 'audio':
        return '🎤 Voice message';
      case 'file':
        return '📄 Document';
      default:
        return 'Sent an attachment';
    }
  }

  Future<List<ChatMessageView>> _toViews(
    final Session session,
    final List<ChatMessage> messages,
    final UuidValue myId,
  ) async {
    if (messages.isEmpty) return [];

    final messageIds = messages.map((final m) => m.id!).toSet();
    final reactions = await MessageReaction.db.find(
      session,
      where: (final t) => t.messageId.inSet(messageIds),
    );
    final reactionsByMessage = <int, List<MessageReaction>>{};
    for (final r in reactions) {
      reactionsByMessage.putIfAbsent(r.messageId, () => []).add(r);
    }

    final replyIds = messages
        .map((final m) => m.replyToMessageId)
        .whereType<int>()
        .toSet();
    final repliedMessages = replyIds.isEmpty
        ? <ChatMessage>[]
        : await ChatMessage.db.find(
            session,
            where: (final t) => t.id.inSet(replyIds),
          );
    final repliedById = {for (final m in repliedMessages) m.id!: m};

    final views = <ChatMessageView>[];
    for (final m in messages) {
      final isDeleted = m.deletedAt != null;

      final grouped = <String, List<MessageReaction>>{};
      for (final r in reactionsByMessage[m.id] ?? const <MessageReaction>[]) {
        grouped.putIfAbsent(r.emoji, () => []).add(r);
      }
      final reactionSummaries = grouped.entries
          .map(
            (final e) => MessageReactionSummary(
              emoji: e.key,
              count: e.value.length,
              reactedByMe: e.value.any((final r) => r.userId == myId),
            ),
          )
          .toList();

      final replyTo = m.replyToMessageId != null
          ? repliedById[m.replyToMessageId]
          : null;
      final replyDeleted = replyTo?.deletedAt != null;

      views.add(
        ChatMessageView(
          id: m.id!,
          senderId: m.senderId,
          recipientId: m.recipientId,
          text: isDeleted ? '' : m.text,
          mediaUrl: isDeleted ? null : m.mediaUrl,
          mediaType: isDeleted ? null : m.mediaType,
          createdAt: m.createdAt,
          deliveredAt: m.deliveredAt,
          readAt: m.readAt,
          editedAt: m.editedAt,
          isDeleted: isDeleted,
          replyToMessageId: m.replyToMessageId,
          replyToSenderId: replyTo?.senderId,
          replyPreviewText: replyTo == null
              ? null
              : (replyDeleted ? 'This message was deleted' : replyTo.text),
          replyPreviewMediaType: replyTo == null || replyDeleted
              ? null
              : replyTo.mediaType,
          reactions: reactionSummaries,
        ),
      );
    }
    return views;
  }
}
