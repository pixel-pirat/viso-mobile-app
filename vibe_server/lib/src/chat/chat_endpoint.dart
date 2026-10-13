import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../generated/protocol.dart';
import '../presence/presence_util.dart';
import '../push/push_sender.dart';
import 'chat_event_bus.dart';

/// Real direct-messaging between signed-in users: conversation list,
/// message history, sending (text/media/replies/link previews), reactions,
/// edits, deletes, forwarding, read/delivered receipts, typing, live
/// updates (via [watchConversation]/[watchMyMessages]/[watchTyping]),
/// blocking, muting, pinning, archiving, starring, and finding people to
/// message.
class ChatEndpoint extends Endpoint {
  final UserProfiles _userProfiles = const UserProfiles();

  static final _urlPattern = RegExp(r'https?://[^\s]+');

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

  /// Streams live updates (new/edited/deleted messages, reactions,
  /// delivery/read receipts) for the conversation with [partnerId].
  Stream<ChatMessageView> watchConversation(
    final Session session,
    final UuidValue partnerId,
  ) async* {
    final myId = session.authenticated!.authUserId;
    yield* ChatEventBus.instance.messageUpdates.where((final view) {
      final participants = {view.senderId, view.recipientId};
      return participants.contains(myId) && participants.contains(partnerId);
    });
  }

  /// Streams live updates for every conversation the signed-in user is
  /// part of — used by the chat list to refresh instantly instead of
  /// polling.
  Stream<ChatMessageView> watchMyMessages(final Session session) async* {
    final myId = session.authenticated!.authUserId;
    yield* ChatEventBus.instance.messageUpdates.where(
      (final view) => view.senderId == myId || view.recipientId == myId,
    );
  }

  /// Streams typing signals from [partnerId] directed at the signed-in
  /// user.
  Stream<TypingStatus> watchTyping(
    final Session session,
    final UuidValue partnerId,
  ) async* {
    final myId = session.authenticated!.authUserId;
    yield* ChatEventBus.instance.typingUpdates.where(
      (final status) =>
          status.toUserId == myId && status.fromUserId == partnerId,
    );
  }

  /// Broadcasts whether the signed-in user is currently typing to
  /// [partnerId]. Transient — not persisted.
  Future<void> setTyping(
    final Session session,
    final UuidValue partnerId,
    final bool isTyping,
  ) async {
    final myId = session.authenticated!.authUserId;
    ChatEventBus.instance.publishTyping(
      TypingStatus(fromUserId: myId, toUserId: partnerId, isTyping: isTyping),
    );
  }

  /// Returns the signed-in user's conversations, most recent first, with
  /// pinned ones pinned to the top. Excludes archived conversations — see
  /// [getArchivedConversations].
  Future<List<ChatConversationSummary>> listConversations(
    final Session session,
  ) {
    return _buildConversationSummaries(session, archivedOnly: false);
  }

  /// Returns only the signed-in user's archived conversations.
  Future<List<ChatConversationSummary>> getArchivedConversations(
    final Session session,
  ) {
    return _buildConversationSummaries(session, archivedOnly: true);
  }

  Future<List<ChatConversationSummary>> _buildConversationSummaries(
    final Session session, {
    required final bool archivedOnly,
  }) async {
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

    final archivedIds = (await ArchivedConversation.db.find(
      session,
      where: (final t) => t.userId.equals(myId),
    )).map((final r) => r.archivedUserId).toSet();
    final mutedIds = (await MutedConversation.db.find(
      session,
      where: (final t) => t.userId.equals(myId),
    )).map((final r) => r.mutedUserId).toSet();
    final pinnedIds = (await PinnedConversation.db.find(
      session,
      where: (final t) => t.userId.equals(myId),
    )).map((final r) => r.pinnedUserId).toSet();

    final summaries = <ChatConversationSummary>[];
    for (final entry in lastMessageByPartner.entries) {
      final partnerId = entry.key;
      final isArchived = archivedIds.contains(partnerId);
      if (archivedOnly != isArchived) continue;

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
          isMuted: mutedIds.contains(partnerId),
          isPinned: pinnedIds.contains(partnerId),
        ),
      );
    }

    summaries.sort((final a, final b) {
      if (!archivedOnly && a.isPinned != b.isPinned) {
        return a.isPinned ? -1 : 1;
      }
      return b.lastMessageAt.compareTo(a.lastMessageAt);
    });
    return summaries;
  }

  // -------------------------------------------------------
  // Blocking
  // -------------------------------------------------------

  Future<void> blockUser(final Session session, final UuidValue userId) async {
    final myId = session.authenticated!.authUserId;
    if (userId == myId) throw ArgumentError('Cannot block yourself.');
    final existing = await BlockedUser.db.findFirstRow(
      session,
      where: (final t) => t.blockerId.equals(myId) & t.blockedId.equals(userId),
    );
    if (existing != null) return;
    await BlockedUser.db.insertRow(
      session,
      BlockedUser(blockerId: myId, blockedId: userId),
    );
  }

  Future<void> unblockUser(
    final Session session,
    final UuidValue userId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await BlockedUser.db.findFirstRow(
      session,
      where: (final t) => t.blockerId.equals(myId) & t.blockedId.equals(userId),
    );
    if (existing != null) await BlockedUser.db.deleteRow(session, existing);
  }

  /// Whether the signed-in user has blocked [userId] (used to label the
  /// "Block"/"Unblock" menu item correctly).
  Future<bool> haveIBlocked(
    final Session session,
    final UuidValue userId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await BlockedUser.db.findFirstRow(
      session,
      where: (final t) => t.blockerId.equals(myId) & t.blockedId.equals(userId),
    );
    return existing != null;
  }

  /// Whether the signed-in user can currently message [partnerId] — false
  /// if either party has blocked the other.
  Future<bool> canMessage(
    final Session session,
    final UuidValue partnerId,
  ) async {
    final myId = session.authenticated!.authUserId;
    return !await _isBlockedEitherWay(session, myId, partnerId);
  }

  /// Returns the profiles of everyone the signed-in user has blocked.
  Future<List<UserProfileModel>> getBlockedUsers(
    final Session session,
  ) async {
    final myId = session.authenticated!.authUserId;
    final rows = await BlockedUser.db.find(
      session,
      where: (final t) => t.blockerId.equals(myId),
      orderBy: (final t) => t.createdAt,
      orderDescending: true,
    );
    final profiles = <UserProfileModel>[];
    for (final row in rows) {
      final profile = await _userProfiles.maybeFindUserProfileByUserId(
        session,
        row.blockedId,
      );
      if (profile != null) profiles.add(profile);
    }
    return profiles;
  }

  Future<bool> _isBlockedEitherWay(
    final Session session,
    final UuidValue a,
    final UuidValue b,
  ) async {
    final existing = await BlockedUser.db.findFirstRow(
      session,
      where: (final t) =>
          (t.blockerId.equals(a) & t.blockedId.equals(b)) |
          (t.blockerId.equals(b) & t.blockedId.equals(a)),
    );
    return existing != null;
  }

  // -------------------------------------------------------
  // Mute / pin / archive
  // -------------------------------------------------------

  Future<void> muteConversation(
    final Session session,
    final UuidValue partnerId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await MutedConversation.db.findFirstRow(
      session,
      where: (final t) =>
          t.userId.equals(myId) & t.mutedUserId.equals(partnerId),
    );
    if (existing != null) return;
    await MutedConversation.db.insertRow(
      session,
      MutedConversation(userId: myId, mutedUserId: partnerId),
    );
  }

  Future<void> unmuteConversation(
    final Session session,
    final UuidValue partnerId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await MutedConversation.db.findFirstRow(
      session,
      where: (final t) =>
          t.userId.equals(myId) & t.mutedUserId.equals(partnerId),
    );
    if (existing != null) {
      await MutedConversation.db.deleteRow(session, existing);
    }
  }

  Future<void> pinConversation(
    final Session session,
    final UuidValue partnerId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await PinnedConversation.db.findFirstRow(
      session,
      where: (final t) =>
          t.userId.equals(myId) & t.pinnedUserId.equals(partnerId),
    );
    if (existing != null) return;
    await PinnedConversation.db.insertRow(
      session,
      PinnedConversation(userId: myId, pinnedUserId: partnerId),
    );
  }

  Future<void> unpinConversation(
    final Session session,
    final UuidValue partnerId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await PinnedConversation.db.findFirstRow(
      session,
      where: (final t) =>
          t.userId.equals(myId) & t.pinnedUserId.equals(partnerId),
    );
    if (existing != null) {
      await PinnedConversation.db.deleteRow(session, existing);
    }
  }

  Future<void> archiveConversation(
    final Session session,
    final UuidValue partnerId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await ArchivedConversation.db.findFirstRow(
      session,
      where: (final t) =>
          t.userId.equals(myId) & t.archivedUserId.equals(partnerId),
    );
    if (existing != null) return;
    await ArchivedConversation.db.insertRow(
      session,
      ArchivedConversation(userId: myId, archivedUserId: partnerId),
    );
  }

  Future<void> unarchiveConversation(
    final Session session,
    final UuidValue partnerId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await ArchivedConversation.db.findFirstRow(
      session,
      where: (final t) =>
          t.userId.equals(myId) & t.archivedUserId.equals(partnerId),
    );
    if (existing != null) {
      await ArchivedConversation.db.deleteRow(session, existing);
    }
  }

  // -------------------------------------------------------
  // Starred messages
  // -------------------------------------------------------

  Future<void> starMessage(final Session session, final int messageId) async {
    final myId = session.authenticated!.authUserId;
    final existing = await StarredMessage.db.findFirstRow(
      session,
      where: (final t) => t.userId.equals(myId) & t.messageId.equals(messageId),
    );
    if (existing != null) return;
    await StarredMessage.db.insertRow(
      session,
      StarredMessage(userId: myId, messageId: messageId),
    );
  }

  Future<void> unstarMessage(
    final Session session,
    final int messageId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final existing = await StarredMessage.db.findFirstRow(
      session,
      where: (final t) => t.userId.equals(myId) & t.messageId.equals(messageId),
    );
    if (existing != null) await StarredMessage.db.deleteRow(session, existing);
  }

  /// IDs of every message the signed-in user has starred — cheap to fetch
  /// so the conversation screen can mark loaded messages as starred.
  Future<List<int>> getStarredMessageIds(final Session session) async {
    final myId = session.authenticated!.authUserId;
    final rows = await StarredMessage.db.find(
      session,
      where: (final t) => t.userId.equals(myId),
    );
    return rows.map((final r) => r.messageId).toList();
  }

  /// Full, resolved views of every message the signed-in user has
  /// starred, most recently starred first.
  Future<List<ChatMessageView>> getStarredMessages(
    final Session session,
  ) async {
    final myId = session.authenticated!.authUserId;
    final rows = await StarredMessage.db.find(
      session,
      where: (final t) => t.userId.equals(myId),
      orderBy: (final t) => t.createdAt,
      orderDescending: true,
    );
    if (rows.isEmpty) return [];

    final messageIds = rows.map((final r) => r.messageId).toSet();
    final messages = await ChatMessage.db.find(
      session,
      where: (final t) => t.id.inSet(messageIds),
    );
    final views = await _toViews(session, messages);
    final byId = {for (final v in views) v.id: v};
    return rows
        .map((final r) => byId[r.messageId])
        .whereType<ChatMessageView>()
        .toList();
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
      for (final view in await _toViews(session, toMarkDelivered)) {
        ChatEventBus.instance.publishMessage(view);
      }
    }

    return _toViews(session, visible.reversed.toList());
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
    if (await _isBlockedEitherWay(session, myId, recipientId)) {
      throw ArgumentError('You can\'t message this user.');
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

    // Best-effort; never blocks sending the message itself. Skipped if
    // the recipient has muted this conversation — they still get the
    // AppNotification above, just no OS-level push.
    final isMuted =
        await MutedConversation.db.findFirstRow(
          session,
          where: (final t) =>
              t.userId.equals(recipientId) & t.mutedUserId.equals(myId),
        ) !=
        null;
    if (!isMuted) {
      unawaited(
        PushSender.sendToUser(
          session,
          recipientId,
          title: senderName,
          body: notificationBody,
          data: {'type': 'message', 'senderId': myId.toString()},
        ),
      );
    }

    final view = (await _toViews(session, [message])).first;
    ChatEventBus.instance.publishMessage(view);

    final url = _urlPattern.firstMatch(trimmed)?.group(0);
    if (url != null) {
      unawaited(_fetchAndAttachLinkPreview(session, message.id!, url));
    }

    return view;
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

    final view = (await _toViews(session, [message])).first;
    ChatEventBus.instance.publishMessage(view);
    return view;
  }

  /// Deletes a message for everyone — only the sender can do this. Clears
  /// the content; the client renders a "message deleted" placeholder.
  Future<ChatMessageView> deleteMessageForEveryone(
    final Session session,
    final int messageId,
  ) async {
    final myId = session.authenticated!.authUserId;
    final message = await ChatMessage.db.findById(session, messageId);
    if (message == null) throw ArgumentError('Message not found.');
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

    final view = (await _toViews(session, [message])).first;
    ChatEventBus.instance.publishMessage(view);
    return view;
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
  Future<ChatMessageView> reactToMessage(
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

    final view = (await _toViews(session, [message])).first;
    ChatEventBus.instance.publishMessage(view);
    return view;
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
      for (final view in await _toViews(session, unread)) {
        ChatEventBus.instance.publishMessage(view);
      }
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

      final reactionInfos =
          (reactionsByMessage[m.id] ?? const <MessageReaction>[])
              .map(
                (final r) =>
                    MessageReactionInfo(userId: r.userId, emoji: r.emoji),
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
          linkPreviewUrl: isDeleted ? null : m.linkPreviewUrl,
          linkPreviewTitle: isDeleted ? null : m.linkPreviewTitle,
          linkPreviewDescription: isDeleted ? null : m.linkPreviewDescription,
          linkPreviewImageUrl: isDeleted ? null : m.linkPreviewImageUrl,
          reactions: reactionInfos,
        ),
      );
    }
    return views;
  }

  /// Fetches [url] and parses its Open Graph tags (falling back to
  /// `<title>`) to attach a link preview to [messageId]. Best-effort and
  /// asynchronous — never blocks sending the message, and a failure just
  /// means no preview shows.
  Future<void> _fetchAndAttachLinkPreview(
    final Session session,
    final int messageId,
    final String url,
  ) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 6));
      if (response.statusCode != 200) return;
      final html = response.body;

      final title =
          _extractMetaContent(html, 'og:title') ?? _extractTitleTag(html);
      final description =
          _extractMetaContent(html, 'og:description') ??
          _extractMetaContent(html, 'description');
      final image = _extractMetaContent(html, 'og:image');
      if (title == null && description == null && image == null) return;

      final message = await ChatMessage.db.findById(session, messageId);
      if (message == null || message.deletedAt != null) return;

      message.linkPreviewUrl = url;
      message.linkPreviewTitle = title;
      message.linkPreviewDescription = description;
      message.linkPreviewImageUrl = image;
      await ChatMessage.db.updateRow(session, message);

      final view = (await _toViews(session, [message])).first;
      ChatEventBus.instance.publishMessage(view);
    } catch (_) {
      // Best-effort; see doc comment.
    }
  }

  String? _extractMetaContent(final String html, final String property) {
    final forward = RegExp(
      '<meta[^>]+(?:property|name)=["\']$property["\'][^>]+content=["\']([^"\']*)["\']',
      caseSensitive: false,
    );
    final forwardMatch = forward.firstMatch(html);
    if (forwardMatch != null) return _unescapeHtml(forwardMatch.group(1));

    // Some pages put content before property/name.
    final reversed = RegExp(
      '<meta[^>]+content=["\']([^"\']*)["\'][^>]+(?:property|name)=["\']$property["\']',
      caseSensitive: false,
    );
    final reversedMatch = reversed.firstMatch(html);
    return reversedMatch != null ? _unescapeHtml(reversedMatch.group(1)) : null;
  }

  String? _extractTitleTag(final String html) {
    final match = RegExp(
      r'<title[^>]*>([^<]*)</title>',
      caseSensitive: false,
    ).firstMatch(html);
    return match != null ? _unescapeHtml(match.group(1)) : null;
  }

  String? _unescapeHtml(final String? s) {
    if (s == null) return null;
    return s
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .trim();
  }
}
