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

/// A direct message between two users.
abstract class ChatMessage implements _i1.SerializableModel {
  ChatMessage._({
    this.id,
    required this.senderId,
    required this.recipientId,
    required this.text,
    this.mediaUrl,
    this.mediaType,
    this.replyToMessageId,
    DateTime? createdAt,
    this.deliveredAt,
    this.readAt,
    this.editedAt,
    this.deletedAt,
    this.hiddenForSender,
    this.hiddenForRecipient,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ChatMessage({
    int? id,
    required _i1.UuidValue senderId,
    required _i1.UuidValue recipientId,
    required String text,
    String? mediaUrl,
    String? mediaType,
    int? replyToMessageId,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    DateTime? hiddenForSender,
    DateTime? hiddenForRecipient,
  }) = _ChatMessageImpl;

  factory ChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChatMessage(
      id: jsonSerialization['id'] as int?,
      senderId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['senderId'],
      ),
      recipientId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['recipientId'],
      ),
      text: jsonSerialization['text'] as String,
      mediaUrl: jsonSerialization['mediaUrl'] as String?,
      mediaType: jsonSerialization['mediaType'] as String?,
      replyToMessageId: jsonSerialization['replyToMessageId'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
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
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      hiddenForSender: jsonSerialization['hiddenForSender'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['hiddenForSender'],
            ),
      hiddenForRecipient: jsonSerialization['hiddenForRecipient'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['hiddenForRecipient'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The auth user id of whoever sent this message.
  _i1.UuidValue senderId;

  /// The auth user id of whoever should receive this message.
  _i1.UuidValue recipientId;

  String text;

  /// Set when this message carries a photo/video/voice note/document
  /// instead of (or alongside) text.
  String? mediaUrl;

  String? mediaType;

  /// The message this one is replying to, if any.
  int? replyToMessageId;

  DateTime createdAt;

  /// Set the first time the recipient's client fetches this message.
  DateTime? deliveredAt;

  /// Set once the recipient has opened the conversation.
  DateTime? readAt;

  /// Set when the sender edits the text after sending.
  DateTime? editedAt;

  /// Set when the sender deletes this message for everyone. Text/media
  /// are cleared; the client renders a "message deleted" placeholder.
  DateTime? deletedAt;

  /// Set when the sender/recipient deletes this message for themselves
  /// only — the other party still sees it normally.
  DateTime? hiddenForSender;

  DateTime? hiddenForRecipient;

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatMessage copyWith({
    int? id,
    _i1.UuidValue? senderId,
    _i1.UuidValue? recipientId,
    String? text,
    String? mediaUrl,
    String? mediaType,
    int? replyToMessageId,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    DateTime? hiddenForSender,
    DateTime? hiddenForRecipient,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChatMessage',
      if (id != null) 'id': id,
      'senderId': senderId.toJson(),
      'recipientId': recipientId.toJson(),
      'text': text,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
      if (mediaType != null) 'mediaType': mediaType,
      if (replyToMessageId != null) 'replyToMessageId': replyToMessageId,
      'createdAt': createdAt.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
      if (editedAt != null) 'editedAt': editedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (hiddenForSender != null) 'hiddenForSender': hiddenForSender?.toJson(),
      if (hiddenForRecipient != null)
        'hiddenForRecipient': hiddenForRecipient?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatMessageImpl extends ChatMessage {
  _ChatMessageImpl({
    int? id,
    required _i1.UuidValue senderId,
    required _i1.UuidValue recipientId,
    required String text,
    String? mediaUrl,
    String? mediaType,
    int? replyToMessageId,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    DateTime? hiddenForSender,
    DateTime? hiddenForRecipient,
  }) : super._(
         id: id,
         senderId: senderId,
         recipientId: recipientId,
         text: text,
         mediaUrl: mediaUrl,
         mediaType: mediaType,
         replyToMessageId: replyToMessageId,
         createdAt: createdAt,
         deliveredAt: deliveredAt,
         readAt: readAt,
         editedAt: editedAt,
         deletedAt: deletedAt,
         hiddenForSender: hiddenForSender,
         hiddenForRecipient: hiddenForRecipient,
       );

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatMessage copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? senderId,
    _i1.UuidValue? recipientId,
    String? text,
    Object? mediaUrl = _Undefined,
    Object? mediaType = _Undefined,
    Object? replyToMessageId = _Undefined,
    DateTime? createdAt,
    Object? deliveredAt = _Undefined,
    Object? readAt = _Undefined,
    Object? editedAt = _Undefined,
    Object? deletedAt = _Undefined,
    Object? hiddenForSender = _Undefined,
    Object? hiddenForRecipient = _Undefined,
  }) {
    return ChatMessage(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      text: text ?? this.text,
      mediaUrl: mediaUrl is String? ? mediaUrl : this.mediaUrl,
      mediaType: mediaType is String? ? mediaType : this.mediaType,
      replyToMessageId: replyToMessageId is int?
          ? replyToMessageId
          : this.replyToMessageId,
      createdAt: createdAt ?? this.createdAt,
      deliveredAt: deliveredAt is DateTime? ? deliveredAt : this.deliveredAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
      editedAt: editedAt is DateTime? ? editedAt : this.editedAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      hiddenForSender: hiddenForSender is DateTime?
          ? hiddenForSender
          : this.hiddenForSender,
      hiddenForRecipient: hiddenForRecipient is DateTime?
          ? hiddenForRecipient
          : this.hiddenForRecipient,
    );
  }
}
