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

/// [userId] has archived their conversation with [archivedUserId] —
/// it's hidden from their main chat list until unarchived.
abstract class ArchivedConversation implements _i1.SerializableModel {
  ArchivedConversation._({
    this.id,
    required this.userId,
    required this.archivedUserId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ArchivedConversation({
    int? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue archivedUserId,
    DateTime? createdAt,
  }) = _ArchivedConversationImpl;

  factory ArchivedConversation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ArchivedConversation(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      archivedUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['archivedUserId'],
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

  _i1.UuidValue archivedUserId;

  DateTime createdAt;

  /// Returns a shallow copy of this [ArchivedConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArchivedConversation copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i1.UuidValue? archivedUserId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ArchivedConversation',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'archivedUserId': archivedUserId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArchivedConversationImpl extends ArchivedConversation {
  _ArchivedConversationImpl({
    int? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue archivedUserId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         archivedUserId: archivedUserId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ArchivedConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArchivedConversation copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    _i1.UuidValue? archivedUserId,
    DateTime? createdAt,
  }) {
    return ArchivedConversation(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      archivedUserId: archivedUserId ?? this.archivedUserId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
