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

/// One user's reaction on a message. Raw (not pre-aggregated by viewer)
/// so a single view is valid for every viewer — needed since the same
/// view gets broadcast to both participants over the real-time stream.
abstract class MessageReactionInfo implements _i1.SerializableModel {
  MessageReactionInfo._({
    required this.userId,
    required this.emoji,
  });

  factory MessageReactionInfo({
    required _i1.UuidValue userId,
    required String emoji,
  }) = _MessageReactionInfoImpl;

  factory MessageReactionInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return MessageReactionInfo(
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      emoji: jsonSerialization['emoji'] as String,
    );
  }

  _i1.UuidValue userId;

  String emoji;

  /// Returns a shallow copy of this [MessageReactionInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MessageReactionInfo copyWith({
    _i1.UuidValue? userId,
    String? emoji,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MessageReactionInfo',
      'userId': userId.toJson(),
      'emoji': emoji,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MessageReactionInfoImpl extends MessageReactionInfo {
  _MessageReactionInfoImpl({
    required _i1.UuidValue userId,
    required String emoji,
  }) : super._(
         userId: userId,
         emoji: emoji,
       );

  /// Returns a shallow copy of this [MessageReactionInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MessageReactionInfo copyWith({
    _i1.UuidValue? userId,
    String? emoji,
  }) {
    return MessageReactionInfo(
      userId: userId ?? this.userId,
      emoji: emoji ?? this.emoji,
    );
  }
}
