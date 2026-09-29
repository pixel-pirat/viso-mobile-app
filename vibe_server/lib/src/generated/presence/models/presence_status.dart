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

import 'package:serverpod/serverpod.dart' as _i1;

/// Whether a user is currently online, and when they were last active.
abstract class PresenceStatus
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PresenceStatus._({
    required this.isOnline,
    this.lastActiveAt,
  });

  factory PresenceStatus({
    required bool isOnline,
    DateTime? lastActiveAt,
  }) = _PresenceStatusImpl;

  factory PresenceStatus.fromJson(Map<String, dynamic> jsonSerialization) {
    return PresenceStatus(
      isOnline: _i1.BoolJsonExtension.fromJson(jsonSerialization['isOnline']),
      lastActiveAt: jsonSerialization['lastActiveAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActiveAt'],
            ),
    );
  }

  bool isOnline;

  DateTime? lastActiveAt;

  /// Returns a shallow copy of this [PresenceStatus]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PresenceStatus copyWith({
    bool? isOnline,
    DateTime? lastActiveAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PresenceStatus',
      'isOnline': isOnline,
      if (lastActiveAt != null) 'lastActiveAt': lastActiveAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PresenceStatus',
      'isOnline': isOnline,
      if (lastActiveAt != null) 'lastActiveAt': lastActiveAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PresenceStatusImpl extends PresenceStatus {
  _PresenceStatusImpl({
    required bool isOnline,
    DateTime? lastActiveAt,
  }) : super._(
         isOnline: isOnline,
         lastActiveAt: lastActiveAt,
       );

  /// Returns a shallow copy of this [PresenceStatus]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PresenceStatus copyWith({
    bool? isOnline,
    Object? lastActiveAt = _Undefined,
  }) {
    return PresenceStatus(
      isOnline: isOnline ?? this.isOnline,
      lastActiveAt: lastActiveAt is DateTime?
          ? lastActiveAt
          : this.lastActiveAt,
    );
  }
}
