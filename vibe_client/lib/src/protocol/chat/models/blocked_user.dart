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

/// [blockerId] has blocked [blockedId]. While blocked, neither can
/// message the other.
abstract class BlockedUser implements _i1.SerializableModel {
  BlockedUser._({
    this.id,
    required this.blockerId,
    required this.blockedId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory BlockedUser({
    int? id,
    required _i1.UuidValue blockerId,
    required _i1.UuidValue blockedId,
    DateTime? createdAt,
  }) = _BlockedUserImpl;

  factory BlockedUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlockedUser(
      id: jsonSerialization['id'] as int?,
      blockerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['blockerId'],
      ),
      blockedId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['blockedId'],
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

  _i1.UuidValue blockerId;

  _i1.UuidValue blockedId;

  DateTime createdAt;

  /// Returns a shallow copy of this [BlockedUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BlockedUser copyWith({
    int? id,
    _i1.UuidValue? blockerId,
    _i1.UuidValue? blockedId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BlockedUser',
      if (id != null) 'id': id,
      'blockerId': blockerId.toJson(),
      'blockedId': blockedId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlockedUserImpl extends BlockedUser {
  _BlockedUserImpl({
    int? id,
    required _i1.UuidValue blockerId,
    required _i1.UuidValue blockedId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         blockerId: blockerId,
         blockedId: blockedId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [BlockedUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BlockedUser copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? blockerId,
    _i1.UuidValue? blockedId,
    DateTime? createdAt,
  }) {
    return BlockedUser(
      id: id is int? ? id : this.id,
      blockerId: blockerId ?? this.blockerId,
      blockedId: blockedId ?? this.blockedId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
