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

/// One emoji's aggregated reaction count on a message.
abstract class MessageReactionSummary
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MessageReactionSummary._({
    required this.emoji,
    required this.count,
    required this.reactedByMe,
  });

  factory MessageReactionSummary({
    required String emoji,
    required int count,
    required bool reactedByMe,
  }) = _MessageReactionSummaryImpl;

  factory MessageReactionSummary.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MessageReactionSummary(
      emoji: jsonSerialization['emoji'] as String,
      count: jsonSerialization['count'] as int,
      reactedByMe: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['reactedByMe'],
      ),
    );
  }

  String emoji;

  int count;

  bool reactedByMe;

  /// Returns a shallow copy of this [MessageReactionSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MessageReactionSummary copyWith({
    String? emoji,
    int? count,
    bool? reactedByMe,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MessageReactionSummary',
      'emoji': emoji,
      'count': count,
      'reactedByMe': reactedByMe,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MessageReactionSummary',
      'emoji': emoji,
      'count': count,
      'reactedByMe': reactedByMe,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MessageReactionSummaryImpl extends MessageReactionSummary {
  _MessageReactionSummaryImpl({
    required String emoji,
    required int count,
    required bool reactedByMe,
  }) : super._(
         emoji: emoji,
         count: count,
         reactedByMe: reactedByMe,
       );

  /// Returns a shallow copy of this [MessageReactionSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MessageReactionSummary copyWith({
    String? emoji,
    int? count,
    bool? reactedByMe,
  }) {
    return MessageReactionSummary(
      emoji: emoji ?? this.emoji,
      count: count ?? this.count,
      reactedByMe: reactedByMe ?? this.reactedByMe,
    );
  }
}
