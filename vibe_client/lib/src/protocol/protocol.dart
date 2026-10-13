/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'chat/models/archived_conversation.dart' as _i2;
import 'chat/models/blocked_user.dart' as _i3;
import 'chat/models/chat_conversation_summary.dart' as _i4;
import 'chat/models/chat_message.dart' as _i5;
import 'chat/models/chat_message_view.dart' as _i6;
import 'chat/models/message_reaction.dart' as _i7;
import 'chat/models/message_reaction_info.dart' as _i8;
import 'chat/models/muted_conversation.dart' as _i9;
import 'chat/models/pinned_conversation.dart' as _i10;
import 'chat/models/starred_message.dart' as _i11;
import 'chat/models/typing_status.dart' as _i12;
import 'greetings/greeting.dart' as _i13;
import 'notifications/models/app_notification.dart' as _i14;
import 'posts/models/post.dart' as _i15;
import 'posts/models/post_feed_item.dart' as _i16;
import 'posts/models/post_like.dart' as _i17;
import 'presence/models/presence_status.dart' as _i18;
import 'presence/models/user_presence.dart' as _i19;
import 'push/models/device_token.dart' as _i20;
import 'stories/models/story.dart' as _i21;
import 'stories/models/story_group.dart' as _i22;
import 'stories/models/story_item.dart' as _i23;
import 'stories/models/story_view.dart' as _i24;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i25;
import 'package:vibe_client/src/protocol/chat/models/chat_conversation_summary.dart'
    as _i26;
import 'package:vibe_client/src/protocol/chat/models/chat_message_view.dart'
    as _i27;
import 'package:vibe_client/src/protocol/notifications/models/app_notification.dart'
    as _i28;
import 'package:vibe_client/src/protocol/posts/models/post_feed_item.dart'
    as _i29;
import 'package:vibe_client/src/protocol/stories/models/story_group.dart'
    as _i30;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i31;
export 'chat/models/archived_conversation.dart';
export 'chat/models/blocked_user.dart';
export 'chat/models/chat_conversation_summary.dart';
export 'chat/models/chat_message.dart';
export 'chat/models/chat_message_view.dart';
export 'chat/models/message_reaction.dart';
export 'chat/models/message_reaction_info.dart';
export 'chat/models/muted_conversation.dart';
export 'chat/models/pinned_conversation.dart';
export 'chat/models/starred_message.dart';
export 'chat/models/typing_status.dart';
export 'greetings/greeting.dart';
export 'notifications/models/app_notification.dart';
export 'posts/models/post.dart';
export 'posts/models/post_feed_item.dart';
export 'posts/models/post_like.dart';
export 'presence/models/presence_status.dart';
export 'presence/models/user_presence.dart';
export 'push/models/device_token.dart';
export 'stories/models/story.dart';
export 'stories/models/story_group.dart';
export 'stories/models/story_item.dart';
export 'stories/models/story_view.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.ArchivedConversation) {
      return _i2.ArchivedConversation.fromJson(data) as T;
    }
    if (t == _i3.BlockedUser) {
      return _i3.BlockedUser.fromJson(data) as T;
    }
    if (t == _i4.ChatConversationSummary) {
      return _i4.ChatConversationSummary.fromJson(data) as T;
    }
    if (t == _i5.ChatMessage) {
      return _i5.ChatMessage.fromJson(data) as T;
    }
    if (t == _i6.ChatMessageView) {
      return _i6.ChatMessageView.fromJson(data) as T;
    }
    if (t == _i7.MessageReaction) {
      return _i7.MessageReaction.fromJson(data) as T;
    }
    if (t == _i8.MessageReactionInfo) {
      return _i8.MessageReactionInfo.fromJson(data) as T;
    }
    if (t == _i9.MutedConversation) {
      return _i9.MutedConversation.fromJson(data) as T;
    }
    if (t == _i10.PinnedConversation) {
      return _i10.PinnedConversation.fromJson(data) as T;
    }
    if (t == _i11.StarredMessage) {
      return _i11.StarredMessage.fromJson(data) as T;
    }
    if (t == _i12.TypingStatus) {
      return _i12.TypingStatus.fromJson(data) as T;
    }
    if (t == _i13.Greeting) {
      return _i13.Greeting.fromJson(data) as T;
    }
    if (t == _i14.AppNotification) {
      return _i14.AppNotification.fromJson(data) as T;
    }
    if (t == _i15.Post) {
      return _i15.Post.fromJson(data) as T;
    }
    if (t == _i16.PostFeedItem) {
      return _i16.PostFeedItem.fromJson(data) as T;
    }
    if (t == _i17.PostLike) {
      return _i17.PostLike.fromJson(data) as T;
    }
    if (t == _i18.PresenceStatus) {
      return _i18.PresenceStatus.fromJson(data) as T;
    }
    if (t == _i19.UserPresence) {
      return _i19.UserPresence.fromJson(data) as T;
    }
    if (t == _i20.DeviceToken) {
      return _i20.DeviceToken.fromJson(data) as T;
    }
    if (t == _i21.Story) {
      return _i21.Story.fromJson(data) as T;
    }
    if (t == _i22.StoryGroup) {
      return _i22.StoryGroup.fromJson(data) as T;
    }
    if (t == _i23.StoryItem) {
      return _i23.StoryItem.fromJson(data) as T;
    }
    if (t == _i24.StoryView) {
      return _i24.StoryView.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ArchivedConversation?>()) {
      return (data != null ? _i2.ArchivedConversation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.BlockedUser?>()) {
      return (data != null ? _i3.BlockedUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ChatConversationSummary?>()) {
      return (data != null ? _i4.ChatConversationSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.ChatMessage?>()) {
      return (data != null ? _i5.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ChatMessageView?>()) {
      return (data != null ? _i6.ChatMessageView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.MessageReaction?>()) {
      return (data != null ? _i7.MessageReaction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.MessageReactionInfo?>()) {
      return (data != null ? _i8.MessageReactionInfo.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.MutedConversation?>()) {
      return (data != null ? _i9.MutedConversation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PinnedConversation?>()) {
      return (data != null ? _i10.PinnedConversation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.StarredMessage?>()) {
      return (data != null ? _i11.StarredMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.TypingStatus?>()) {
      return (data != null ? _i12.TypingStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Greeting?>()) {
      return (data != null ? _i13.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.AppNotification?>()) {
      return (data != null ? _i14.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Post?>()) {
      return (data != null ? _i15.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PostFeedItem?>()) {
      return (data != null ? _i16.PostFeedItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PostLike?>()) {
      return (data != null ? _i17.PostLike.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PresenceStatus?>()) {
      return (data != null ? _i18.PresenceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.UserPresence?>()) {
      return (data != null ? _i19.UserPresence.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.DeviceToken?>()) {
      return (data != null ? _i20.DeviceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Story?>()) {
      return (data != null ? _i21.Story.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.StoryGroup?>()) {
      return (data != null ? _i22.StoryGroup.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.StoryItem?>()) {
      return (data != null ? _i23.StoryItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.StoryView?>()) {
      return (data != null ? _i24.StoryView.fromJson(data) : null) as T;
    }
    if (t == List<_i8.MessageReactionInfo>) {
      return (data as List)
              .map((e) => deserialize<_i8.MessageReactionInfo>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i23.StoryItem>) {
      return (data as List).map((e) => deserialize<_i23.StoryItem>(e)).toList()
          as T;
    }
    if (t == List<_i25.UserProfileModel>) {
      return (data as List)
              .map((e) => deserialize<_i25.UserProfileModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i26.ChatConversationSummary>) {
      return (data as List)
              .map((e) => deserialize<_i26.ChatConversationSummary>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i27.ChatMessageView>) {
      return (data as List)
              .map((e) => deserialize<_i27.ChatMessageView>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_i28.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i29.PostFeedItem>) {
      return (data as List)
              .map((e) => deserialize<_i29.PostFeedItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i30.StoryGroup>) {
      return (data as List).map((e) => deserialize<_i30.StoryGroup>(e)).toList()
          as T;
    }
    try {
      return _i25.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i31.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.ArchivedConversation => 'ArchivedConversation',
      _i3.BlockedUser => 'BlockedUser',
      _i4.ChatConversationSummary => 'ChatConversationSummary',
      _i5.ChatMessage => 'ChatMessage',
      _i6.ChatMessageView => 'ChatMessageView',
      _i7.MessageReaction => 'MessageReaction',
      _i8.MessageReactionInfo => 'MessageReactionInfo',
      _i9.MutedConversation => 'MutedConversation',
      _i10.PinnedConversation => 'PinnedConversation',
      _i11.StarredMessage => 'StarredMessage',
      _i12.TypingStatus => 'TypingStatus',
      _i13.Greeting => 'Greeting',
      _i14.AppNotification => 'AppNotification',
      _i15.Post => 'Post',
      _i16.PostFeedItem => 'PostFeedItem',
      _i17.PostLike => 'PostLike',
      _i18.PresenceStatus => 'PresenceStatus',
      _i19.UserPresence => 'UserPresence',
      _i20.DeviceToken => 'DeviceToken',
      _i21.Story => 'Story',
      _i22.StoryGroup => 'StoryGroup',
      _i23.StoryItem => 'StoryItem',
      _i24.StoryView => 'StoryView',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('vibe.', '');
    }

    switch (data) {
      case _i2.ArchivedConversation():
        return 'ArchivedConversation';
      case _i3.BlockedUser():
        return 'BlockedUser';
      case _i4.ChatConversationSummary():
        return 'ChatConversationSummary';
      case _i5.ChatMessage():
        return 'ChatMessage';
      case _i6.ChatMessageView():
        return 'ChatMessageView';
      case _i7.MessageReaction():
        return 'MessageReaction';
      case _i8.MessageReactionInfo():
        return 'MessageReactionInfo';
      case _i9.MutedConversation():
        return 'MutedConversation';
      case _i10.PinnedConversation():
        return 'PinnedConversation';
      case _i11.StarredMessage():
        return 'StarredMessage';
      case _i12.TypingStatus():
        return 'TypingStatus';
      case _i13.Greeting():
        return 'Greeting';
      case _i14.AppNotification():
        return 'AppNotification';
      case _i15.Post():
        return 'Post';
      case _i16.PostFeedItem():
        return 'PostFeedItem';
      case _i17.PostLike():
        return 'PostLike';
      case _i18.PresenceStatus():
        return 'PresenceStatus';
      case _i19.UserPresence():
        return 'UserPresence';
      case _i20.DeviceToken():
        return 'DeviceToken';
      case _i21.Story():
        return 'Story';
      case _i22.StoryGroup():
        return 'StoryGroup';
      case _i23.StoryItem():
        return 'StoryItem';
      case _i24.StoryView():
        return 'StoryView';
    }
    className = _i25.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    className = _i31.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ArchivedConversation') {
      return deserialize<_i2.ArchivedConversation>(data['data']);
    }
    if (dataClassName == 'BlockedUser') {
      return deserialize<_i3.BlockedUser>(data['data']);
    }
    if (dataClassName == 'ChatConversationSummary') {
      return deserialize<_i4.ChatConversationSummary>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i5.ChatMessage>(data['data']);
    }
    if (dataClassName == 'ChatMessageView') {
      return deserialize<_i6.ChatMessageView>(data['data']);
    }
    if (dataClassName == 'MessageReaction') {
      return deserialize<_i7.MessageReaction>(data['data']);
    }
    if (dataClassName == 'MessageReactionInfo') {
      return deserialize<_i8.MessageReactionInfo>(data['data']);
    }
    if (dataClassName == 'MutedConversation') {
      return deserialize<_i9.MutedConversation>(data['data']);
    }
    if (dataClassName == 'PinnedConversation') {
      return deserialize<_i10.PinnedConversation>(data['data']);
    }
    if (dataClassName == 'StarredMessage') {
      return deserialize<_i11.StarredMessage>(data['data']);
    }
    if (dataClassName == 'TypingStatus') {
      return deserialize<_i12.TypingStatus>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i13.Greeting>(data['data']);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_i14.AppNotification>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i15.Post>(data['data']);
    }
    if (dataClassName == 'PostFeedItem') {
      return deserialize<_i16.PostFeedItem>(data['data']);
    }
    if (dataClassName == 'PostLike') {
      return deserialize<_i17.PostLike>(data['data']);
    }
    if (dataClassName == 'PresenceStatus') {
      return deserialize<_i18.PresenceStatus>(data['data']);
    }
    if (dataClassName == 'UserPresence') {
      return deserialize<_i19.UserPresence>(data['data']);
    }
    if (dataClassName == 'DeviceToken') {
      return deserialize<_i20.DeviceToken>(data['data']);
    }
    if (dataClassName == 'Story') {
      return deserialize<_i21.Story>(data['data']);
    }
    if (dataClassName == 'StoryGroup') {
      return deserialize<_i22.StoryGroup>(data['data']);
    }
    if (dataClassName == 'StoryItem') {
      return deserialize<_i23.StoryItem>(data['data']);
    }
    if (dataClassName == 'StoryView') {
      return deserialize<_i24.StoryView>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i25.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i31.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i25.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i31.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
