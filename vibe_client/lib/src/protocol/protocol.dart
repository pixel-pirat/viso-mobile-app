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
import 'chat/models/chat_conversation_summary.dart' as _i2;
import 'chat/models/chat_message.dart' as _i3;
import 'greetings/greeting.dart' as _i4;
import 'notifications/models/app_notification.dart' as _i5;
import 'posts/models/post.dart' as _i6;
import 'posts/models/post_feed_item.dart' as _i7;
import 'posts/models/post_like.dart' as _i8;
import 'presence/models/presence_status.dart' as _i9;
import 'presence/models/user_presence.dart' as _i10;
import 'push/models/device_token.dart' as _i11;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i12;
import 'package:vibe_client/src/protocol/chat/models/chat_conversation_summary.dart'
    as _i13;
import 'package:vibe_client/src/protocol/chat/models/chat_message.dart' as _i14;
import 'package:vibe_client/src/protocol/notifications/models/app_notification.dart'
    as _i15;
import 'package:vibe_client/src/protocol/posts/models/post_feed_item.dart'
    as _i16;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i17;
export 'chat/models/chat_conversation_summary.dart';
export 'chat/models/chat_message.dart';
export 'greetings/greeting.dart';
export 'notifications/models/app_notification.dart';
export 'posts/models/post.dart';
export 'posts/models/post_feed_item.dart';
export 'posts/models/post_like.dart';
export 'presence/models/presence_status.dart';
export 'presence/models/user_presence.dart';
export 'push/models/device_token.dart';
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

    if (t == _i2.ChatConversationSummary) {
      return _i2.ChatConversationSummary.fromJson(data) as T;
    }
    if (t == _i3.ChatMessage) {
      return _i3.ChatMessage.fromJson(data) as T;
    }
    if (t == _i4.Greeting) {
      return _i4.Greeting.fromJson(data) as T;
    }
    if (t == _i5.AppNotification) {
      return _i5.AppNotification.fromJson(data) as T;
    }
    if (t == _i6.Post) {
      return _i6.Post.fromJson(data) as T;
    }
    if (t == _i7.PostFeedItem) {
      return _i7.PostFeedItem.fromJson(data) as T;
    }
    if (t == _i8.PostLike) {
      return _i8.PostLike.fromJson(data) as T;
    }
    if (t == _i9.PresenceStatus) {
      return _i9.PresenceStatus.fromJson(data) as T;
    }
    if (t == _i10.UserPresence) {
      return _i10.UserPresence.fromJson(data) as T;
    }
    if (t == _i11.DeviceToken) {
      return _i11.DeviceToken.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ChatConversationSummary?>()) {
      return (data != null ? _i2.ChatConversationSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.ChatMessage?>()) {
      return (data != null ? _i3.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Greeting?>()) {
      return (data != null ? _i4.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AppNotification?>()) {
      return (data != null ? _i5.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Post?>()) {
      return (data != null ? _i6.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.PostFeedItem?>()) {
      return (data != null ? _i7.PostFeedItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PostLike?>()) {
      return (data != null ? _i8.PostLike.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PresenceStatus?>()) {
      return (data != null ? _i9.PresenceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.UserPresence?>()) {
      return (data != null ? _i10.UserPresence.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DeviceToken?>()) {
      return (data != null ? _i11.DeviceToken.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i12.UserProfileModel>) {
      return (data as List)
              .map((e) => deserialize<_i12.UserProfileModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i13.ChatConversationSummary>) {
      return (data as List)
              .map((e) => deserialize<_i13.ChatConversationSummary>(e))
              .toList()
          as T;
    }
    if (t == List<_i14.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i14.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i15.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_i15.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i16.PostFeedItem>) {
      return (data as List)
              .map((e) => deserialize<_i16.PostFeedItem>(e))
              .toList()
          as T;
    }
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i17.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.ChatConversationSummary => 'ChatConversationSummary',
      _i3.ChatMessage => 'ChatMessage',
      _i4.Greeting => 'Greeting',
      _i5.AppNotification => 'AppNotification',
      _i6.Post => 'Post',
      _i7.PostFeedItem => 'PostFeedItem',
      _i8.PostLike => 'PostLike',
      _i9.PresenceStatus => 'PresenceStatus',
      _i10.UserPresence => 'UserPresence',
      _i11.DeviceToken => 'DeviceToken',
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
      case _i2.ChatConversationSummary():
        return 'ChatConversationSummary';
      case _i3.ChatMessage():
        return 'ChatMessage';
      case _i4.Greeting():
        return 'Greeting';
      case _i5.AppNotification():
        return 'AppNotification';
      case _i6.Post():
        return 'Post';
      case _i7.PostFeedItem():
        return 'PostFeedItem';
      case _i8.PostLike():
        return 'PostLike';
      case _i9.PresenceStatus():
        return 'PresenceStatus';
      case _i10.UserPresence():
        return 'UserPresence';
      case _i11.DeviceToken():
        return 'DeviceToken';
    }
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    className = _i17.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'ChatConversationSummary') {
      return deserialize<_i2.ChatConversationSummary>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i3.ChatMessage>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i4.Greeting>(data['data']);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_i5.AppNotification>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i6.Post>(data['data']);
    }
    if (dataClassName == 'PostFeedItem') {
      return deserialize<_i7.PostFeedItem>(data['data']);
    }
    if (dataClassName == 'PostLike') {
      return deserialize<_i8.PostLike>(data['data']);
    }
    if (dataClassName == 'PresenceStatus') {
      return deserialize<_i9.PresenceStatus>(data['data']);
    }
    if (dataClassName == 'UserPresence') {
      return deserialize<_i10.UserPresence>(data['data']);
    }
    if (dataClassName == 'DeviceToken') {
      return deserialize<_i11.DeviceToken>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i12.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i17.Protocol().deserializeByClassName(data);
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
      return _i12.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i17.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
