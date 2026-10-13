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

/// [userId] has starred [messageId] for quick reference later.
abstract class StarredMessage implements _i1.SerializableModel {
  StarredMessage._({
    this.id,
    required this.userId,
    required this.messageId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory StarredMessage({
    int? id,
    required _i1.UuidValue userId,
    required int messageId,
    DateTime? createdAt,
  }) = _StarredMessageImpl;

  factory StarredMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return StarredMessage(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      messageId: jsonSerialization['messageId'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue userId;

  int messageId;

  DateTime createdAt;

  /// Returns a shallow copy of this [StarredMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StarredMessage copyWith({
    int? id,
    _i1.UuidValue? userId,
    int? messageId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StarredMessage',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'messageId': messageId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StarredMessageImpl extends StarredMessage {
  _StarredMessageImpl({
    int? id,
    required _i1.UuidValue userId,
    required int messageId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         messageId: messageId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [StarredMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StarredMessage copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    int? messageId,
    DateTime? createdAt,
  }) {
    return StarredMessage(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      messageId: messageId ?? this.messageId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
