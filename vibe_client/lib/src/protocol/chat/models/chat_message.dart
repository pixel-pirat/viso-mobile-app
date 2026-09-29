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
    DateTime? createdAt,
    this.readAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ChatMessage({
    int? id,
    required _i1.UuidValue senderId,
    required _i1.UuidValue recipientId,
    required String text,
    DateTime? createdAt,
    DateTime? readAt,
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
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
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

  DateTime createdAt;

  /// Set once the recipient has opened the conversation.
  DateTime? readAt;

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatMessage copyWith({
    int? id,
    _i1.UuidValue? senderId,
    _i1.UuidValue? recipientId,
    String? text,
    DateTime? createdAt,
    DateTime? readAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChatMessage',
      if (id != null) 'id': id,
      'senderId': senderId.toJson(),
      'recipientId': recipientId.toJson(),
      'text': text,
      'createdAt': createdAt.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
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
    DateTime? createdAt,
    DateTime? readAt,
  }) : super._(
         id: id,
         senderId: senderId,
         recipientId: recipientId,
         text: text,
         createdAt: createdAt,
         readAt: readAt,
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
    DateTime? createdAt,
    Object? readAt = _Undefined,
  }) {
    return ChatMessage(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
    );
  }
}
