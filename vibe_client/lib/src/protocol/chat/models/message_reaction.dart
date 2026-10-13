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

/// A single-emoji reaction by one user on one chat message. A user can
/// have at most one reaction per message (re-reacting replaces it;
/// reacting with the same emoji again removes it).
abstract class MessageReaction implements _i1.SerializableModel {
  MessageReaction._({
    this.id,
    required this.messageId,
    required this.userId,
    required this.emoji,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory MessageReaction({
    int? id,
    required int messageId,
    required _i1.UuidValue userId,
    required String emoji,
    DateTime? createdAt,
  }) = _MessageReactionImpl;

  factory MessageReaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return MessageReaction(
      id: jsonSerialization['id'] as int?,
      messageId: jsonSerialization['messageId'] as int,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      emoji: jsonSerialization['emoji'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int messageId;

  _i1.UuidValue userId;

  String emoji;

  DateTime createdAt;

  /// Returns a shallow copy of this [MessageReaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MessageReaction copyWith({
    int? id,
    int? messageId,
    _i1.UuidValue? userId,
    String? emoji,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MessageReaction',
      if (id != null) 'id': id,
      'messageId': messageId,
      'userId': userId.toJson(),
      'emoji': emoji,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MessageReactionImpl extends MessageReaction {
  _MessageReactionImpl({
    int? id,
    required int messageId,
    required _i1.UuidValue userId,
    required String emoji,
    DateTime? createdAt,
  }) : super._(
         id: id,
         messageId: messageId,
         userId: userId,
         emoji: emoji,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [MessageReaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MessageReaction copyWith({
    Object? id = _Undefined,
    int? messageId,
    _i1.UuidValue? userId,
    String? emoji,
    DateTime? createdAt,
  }) {
    return MessageReaction(
      id: id is int? ? id : this.id,
      messageId: messageId ?? this.messageId,
      userId: userId ?? this.userId,
      emoji: emoji ?? this.emoji,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
