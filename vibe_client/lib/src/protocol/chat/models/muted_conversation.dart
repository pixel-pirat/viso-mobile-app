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

/// [userId] has muted push notifications for messages from
/// [mutedUserId]. Messages still arrive normally; only the push is
/// suppressed.
abstract class MutedConversation implements _i1.SerializableModel {
  MutedConversation._({
    this.id,
    required this.userId,
    required this.mutedUserId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory MutedConversation({
    int? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue mutedUserId,
    DateTime? createdAt,
  }) = _MutedConversationImpl;

  factory MutedConversation.fromJson(Map<String, dynamic> jsonSerialization) {
    return MutedConversation(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      mutedUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['mutedUserId'],
      ),
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

  _i1.UuidValue mutedUserId;

  DateTime createdAt;

  /// Returns a shallow copy of this [MutedConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MutedConversation copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i1.UuidValue? mutedUserId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MutedConversation',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'mutedUserId': mutedUserId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MutedConversationImpl extends MutedConversation {
  _MutedConversationImpl({
    int? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue mutedUserId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         mutedUserId: mutedUserId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [MutedConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MutedConversation copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    _i1.UuidValue? mutedUserId,
    DateTime? createdAt,
  }) {
    return MutedConversation(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      mutedUserId: mutedUserId ?? this.mutedUserId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
