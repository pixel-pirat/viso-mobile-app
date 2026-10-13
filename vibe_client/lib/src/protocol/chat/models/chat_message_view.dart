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
import '../../chat/models/message_reaction_info.dart' as _i2;
import 'package:vibe_client/src/protocol/protocol.dart' as _i3;

/// A fully-resolved chat message, ready for the client to render: media,
/// reply preview and reaction summary already attached.
abstract class ChatMessageView implements _i1.SerializableModel {
  ChatMessageView._({
    required this.id,
    required this.senderId,
    required this.recipientId,
    required this.text,
    this.mediaUrl,
    this.mediaType,
    required this.createdAt,
    this.deliveredAt,
    this.readAt,
    this.editedAt,
    required this.isDeleted,
    this.replyToMessageId,
    this.replyToSenderId,
    this.replyPreviewText,
    this.replyPreviewMediaType,
    this.linkPreviewUrl,
    this.linkPreviewTitle,
    this.linkPreviewDescription,
    this.linkPreviewImageUrl,
    required this.reactions,
  });

  factory ChatMessageView({
    required int id,
    required _i1.UuidValue senderId,
    required _i1.UuidValue recipientId,
    required String text,
    String? mediaUrl,
    String? mediaType,
    required DateTime createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    required bool isDeleted,
    int? replyToMessageId,
    _i1.UuidValue? replyToSenderId,
    String? replyPreviewText,
    String? replyPreviewMediaType,
    String? linkPreviewUrl,
    String? linkPreviewTitle,
    String? linkPreviewDescription,
    String? linkPreviewImageUrl,
    required List<_i2.MessageReactionInfo> reactions,
  }) = _ChatMessageViewImpl;

  factory ChatMessageView.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChatMessageView(
      id: jsonSerialization['id'] as int,
      senderId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['senderId'],
      ),
      recipientId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['recipientId'],
      ),
      text: jsonSerialization['text'] as String,
      mediaUrl: jsonSerialization['mediaUrl'] as String?,
      mediaType: jsonSerialization['mediaType'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      deliveredAt: jsonSerialization['deliveredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['deliveredAt'],
            ),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
      editedAt: jsonSerialization['editedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['editedAt']),
      isDeleted: _i1.BoolJsonExtension.fromJson(jsonSerialization['isDeleted']),
      replyToMessageId: jsonSerialization['replyToMessageId'] as int?,
      replyToSenderId: jsonSerialization['replyToSenderId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['replyToSenderId'],
            ),
      replyPreviewText: jsonSerialization['replyPreviewText'] as String?,
      replyPreviewMediaType:
          jsonSerialization['replyPreviewMediaType'] as String?,
      linkPreviewUrl: jsonSerialization['linkPreviewUrl'] as String?,
      linkPreviewTitle: jsonSerialization['linkPreviewTitle'] as String?,
      linkPreviewDescription:
          jsonSerialization['linkPreviewDescription'] as String?,
      linkPreviewImageUrl: jsonSerialization['linkPreviewImageUrl'] as String?,
      reactions: _i3.Protocol().deserialize<List<_i2.MessageReactionInfo>>(
        jsonSerialization['reactions'],
      ),
    );
  }

  int id;

  _i1.UuidValue senderId;

  _i1.UuidValue recipientId;

  String text;

  String? mediaUrl;

  String? mediaType;

  DateTime createdAt;

  DateTime? deliveredAt;

  DateTime? readAt;

  DateTime? editedAt;

  bool isDeleted;

  int? replyToMessageId;

  _i1.UuidValue? replyToSenderId;

  String? replyPreviewText;

  String? replyPreviewMediaType;

  String? linkPreviewUrl;

  String? linkPreviewTitle;

  String? linkPreviewDescription;

  String? linkPreviewImageUrl;

  List<_i2.MessageReactionInfo> reactions;

  /// Returns a shallow copy of this [ChatMessageView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatMessageView copyWith({
    int? id,
    _i1.UuidValue? senderId,
    _i1.UuidValue? recipientId,
    String? text,
    String? mediaUrl,
    String? mediaType,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    bool? isDeleted,
    int? replyToMessageId,
    _i1.UuidValue? replyToSenderId,
    String? replyPreviewText,
    String? replyPreviewMediaType,
    String? linkPreviewUrl,
    String? linkPreviewTitle,
    String? linkPreviewDescription,
    String? linkPreviewImageUrl,
    List<_i2.MessageReactionInfo>? reactions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChatMessageView',
      'id': id,
      'senderId': senderId.toJson(),
      'recipientId': recipientId.toJson(),
      'text': text,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
      if (mediaType != null) 'mediaType': mediaType,
      'createdAt': createdAt.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
      if (editedAt != null) 'editedAt': editedAt?.toJson(),
      'isDeleted': isDeleted,
      if (replyToMessageId != null) 'replyToMessageId': replyToMessageId,
      if (replyToSenderId != null) 'replyToSenderId': replyToSenderId?.toJson(),
      if (replyPreviewText != null) 'replyPreviewText': replyPreviewText,
      if (replyPreviewMediaType != null)
        'replyPreviewMediaType': replyPreviewMediaType,
      if (linkPreviewUrl != null) 'linkPreviewUrl': linkPreviewUrl,
      if (linkPreviewTitle != null) 'linkPreviewTitle': linkPreviewTitle,
      if (linkPreviewDescription != null)
        'linkPreviewDescription': linkPreviewDescription,
      if (linkPreviewImageUrl != null)
        'linkPreviewImageUrl': linkPreviewImageUrl,
      'reactions': reactions.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatMessageViewImpl extends ChatMessageView {
  _ChatMessageViewImpl({
    required int id,
    required _i1.UuidValue senderId,
    required _i1.UuidValue recipientId,
    required String text,
    String? mediaUrl,
    String? mediaType,
    required DateTime createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    required bool isDeleted,
    int? replyToMessageId,
    _i1.UuidValue? replyToSenderId,
    String? replyPreviewText,
    String? replyPreviewMediaType,
    String? linkPreviewUrl,
    String? linkPreviewTitle,
    String? linkPreviewDescription,
    String? linkPreviewImageUrl,
    required List<_i2.MessageReactionInfo> reactions,
  }) : super._(
         id: id,
         senderId: senderId,
         recipientId: recipientId,
         text: text,
         mediaUrl: mediaUrl,
         mediaType: mediaType,
         createdAt: createdAt,
         deliveredAt: deliveredAt,
         readAt: readAt,
         editedAt: editedAt,
         isDeleted: isDeleted,
         replyToMessageId: replyToMessageId,
         replyToSenderId: replyToSenderId,
         replyPreviewText: replyPreviewText,
         replyPreviewMediaType: replyPreviewMediaType,
         linkPreviewUrl: linkPreviewUrl,
         linkPreviewTitle: linkPreviewTitle,
         linkPreviewDescription: linkPreviewDescription,
         linkPreviewImageUrl: linkPreviewImageUrl,
         reactions: reactions,
       );

  /// Returns a shallow copy of this [ChatMessageView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatMessageView copyWith({
    int? id,
    _i1.UuidValue? senderId,
    _i1.UuidValue? recipientId,
    String? text,
    Object? mediaUrl = _Undefined,
    Object? mediaType = _Undefined,
    DateTime? createdAt,
    Object? deliveredAt = _Undefined,
    Object? readAt = _Undefined,
    Object? editedAt = _Undefined,
    bool? isDeleted,
    Object? replyToMessageId = _Undefined,
    Object? replyToSenderId = _Undefined,
    Object? replyPreviewText = _Undefined,
    Object? replyPreviewMediaType = _Undefined,
    Object? linkPreviewUrl = _Undefined,
    Object? linkPreviewTitle = _Undefined,
    Object? linkPreviewDescription = _Undefined,
    Object? linkPreviewImageUrl = _Undefined,
    List<_i2.MessageReactionInfo>? reactions,
  }) {
    return ChatMessageView(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      text: text ?? this.text,
      mediaUrl: mediaUrl is String? ? mediaUrl : this.mediaUrl,
      mediaType: mediaType is String? ? mediaType : this.mediaType,
      createdAt: createdAt ?? this.createdAt,
      deliveredAt: deliveredAt is DateTime? ? deliveredAt : this.deliveredAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
      editedAt: editedAt is DateTime? ? editedAt : this.editedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      replyToMessageId: replyToMessageId is int?
          ? replyToMessageId
          : this.replyToMessageId,
      replyToSenderId: replyToSenderId is _i1.UuidValue?
          ? replyToSenderId
          : this.replyToSenderId,
      replyPreviewText: replyPreviewText is String?
          ? replyPreviewText
          : this.replyPreviewText,
      replyPreviewMediaType: replyPreviewMediaType is String?
          ? replyPreviewMediaType
          : this.replyPreviewMediaType,
      linkPreviewUrl: linkPreviewUrl is String?
          ? linkPreviewUrl
          : this.linkPreviewUrl,
      linkPreviewTitle: linkPreviewTitle is String?
          ? linkPreviewTitle
          : this.linkPreviewTitle,
      linkPreviewDescription: linkPreviewDescription is String?
          ? linkPreviewDescription
          : this.linkPreviewDescription,
      linkPreviewImageUrl: linkPreviewImageUrl is String?
          ? linkPreviewImageUrl
          : this.linkPreviewImageUrl,
      reactions:
          reactions ?? this.reactions.map((e0) => e0.copyWith()).toList(),
    );
  }
}
