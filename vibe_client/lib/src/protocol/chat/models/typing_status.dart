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

/// A transient (not persisted) typing signal broadcast over
/// [ChatEndpoint.watchTyping].
abstract class TypingStatus implements _i1.SerializableModel {
  TypingStatus._({
    required this.fromUserId,
    required this.toUserId,
    required this.isTyping,
  });

  factory TypingStatus({
    required _i1.UuidValue fromUserId,
    required _i1.UuidValue toUserId,
    required bool isTyping,
  }) = _TypingStatusImpl;

  factory TypingStatus.fromJson(Map<String, dynamic> jsonSerialization) {
    return TypingStatus(
      fromUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['fromUserId'],
      ),
      toUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['toUserId'],
      ),
      isTyping: _i1.BoolJsonExtension.fromJson(jsonSerialization['isTyping']),
    );
  }

  _i1.UuidValue fromUserId;

  _i1.UuidValue toUserId;

  bool isTyping;

  /// Returns a shallow copy of this [TypingStatus]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TypingStatus copyWith({
    _i1.UuidValue? fromUserId,
    _i1.UuidValue? toUserId,
    bool? isTyping,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TypingStatus',
      'fromUserId': fromUserId.toJson(),
      'toUserId': toUserId.toJson(),
      'isTyping': isTyping,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TypingStatusImpl extends TypingStatus {
  _TypingStatusImpl({
    required _i1.UuidValue fromUserId,
    required _i1.UuidValue toUserId,
    required bool isTyping,
  }) : super._(
         fromUserId: fromUserId,
         toUserId: toUserId,
         isTyping: isTyping,
       );

  /// Returns a shallow copy of this [TypingStatus]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TypingStatus copyWith({
    _i1.UuidValue? fromUserId,
    _i1.UuidValue? toUserId,
    bool? isTyping,
  }) {
    return TypingStatus(
      fromUserId: fromUserId ?? this.fromUserId,
      toUserId: toUserId ?? this.toUserId,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}
