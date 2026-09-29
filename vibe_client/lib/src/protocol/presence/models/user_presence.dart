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

/// Tracks when a user was last active, used to compute online/offline
/// status. Updated by a periodic heartbeat call from the app.
abstract class UserPresence implements _i1.SerializableModel {
  UserPresence._({
    this.id,
    required this.authUserId,
    DateTime? lastActiveAt,
  }) : lastActiveAt = lastActiveAt ?? DateTime.now();

  factory UserPresence({
    int? id,
    required _i1.UuidValue authUserId,
    DateTime? lastActiveAt,
  }) = _UserPresenceImpl;

  factory UserPresence.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserPresence(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      lastActiveAt: jsonSerialization['lastActiveAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActiveAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue authUserId;

  DateTime lastActiveAt;

  /// Returns a shallow copy of this [UserPresence]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserPresence copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    DateTime? lastActiveAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserPresence',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'lastActiveAt': lastActiveAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserPresenceImpl extends UserPresence {
  _UserPresenceImpl({
    int? id,
    required _i1.UuidValue authUserId,
    DateTime? lastActiveAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         lastActiveAt: lastActiveAt,
       );

  /// Returns a shallow copy of this [UserPresence]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserPresence copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    DateTime? lastActiveAt,
  }) {
    return UserPresence(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
    );
  }
}
