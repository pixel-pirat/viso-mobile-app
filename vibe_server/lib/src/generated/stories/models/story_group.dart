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
import '../../stories/models/story_item.dart' as _i2;
import 'package:vibe_server/src/generated/protocol.dart' as _i3;

abstract class StoryGroup
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StoryGroup._({
    required this.authorId,
    required this.authorName,
    this.authorAvatarUrl,
    required this.stories,
    required this.hasUnseen,
  });

  factory StoryGroup({
    required _i1.UuidValue authorId,
    required String authorName,
    String? authorAvatarUrl,
    required List<_i2.StoryItem> stories,
    required bool hasUnseen,
  }) = _StoryGroupImpl;

  factory StoryGroup.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoryGroup(
      authorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authorId'],
      ),
      authorName: jsonSerialization['authorName'] as String,
      authorAvatarUrl: jsonSerialization['authorAvatarUrl'] as String?,
      stories: _i3.Protocol().deserialize<List<_i2.StoryItem>>(
        jsonSerialization['stories'],
      ),
      hasUnseen: _i1.BoolJsonExtension.fromJson(jsonSerialization['hasUnseen']),
    );
  }

  _i1.UuidValue authorId;

  String authorName;

  String? authorAvatarUrl;

  List<_i2.StoryItem> stories;

  bool hasUnseen;

  /// Returns a shallow copy of this [StoryGroup]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoryGroup copyWith({
    _i1.UuidValue? authorId,
    String? authorName,
    String? authorAvatarUrl,
    List<_i2.StoryItem>? stories,
    bool? hasUnseen,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoryGroup',
      'authorId': authorId.toJson(),
      'authorName': authorName,
      if (authorAvatarUrl != null) 'authorAvatarUrl': authorAvatarUrl,
      'stories': stories.toJson(valueToJson: (v) => v.toJson()),
      'hasUnseen': hasUnseen,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StoryGroup',
      'authorId': authorId.toJson(),
      'authorName': authorName,
      if (authorAvatarUrl != null) 'authorAvatarUrl': authorAvatarUrl,
      'stories': stories.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'hasUnseen': hasUnseen,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoryGroupImpl extends StoryGroup {
  _StoryGroupImpl({
    required _i1.UuidValue authorId,
    required String authorName,
    String? authorAvatarUrl,
    required List<_i2.StoryItem> stories,
    required bool hasUnseen,
  }) : super._(
         authorId: authorId,
         authorName: authorName,
         authorAvatarUrl: authorAvatarUrl,
         stories: stories,
         hasUnseen: hasUnseen,
       );

  /// Returns a shallow copy of this [StoryGroup]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoryGroup copyWith({
    _i1.UuidValue? authorId,
    String? authorName,
    Object? authorAvatarUrl = _Undefined,
    List<_i2.StoryItem>? stories,
    bool? hasUnseen,
  }) {
    return StoryGroup(
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      authorAvatarUrl: authorAvatarUrl is String?
          ? authorAvatarUrl
          : this.authorAvatarUrl,
      stories: stories ?? this.stories.map((e0) => e0.copyWith()).toList(),
      hasUnseen: hasUnseen ?? this.hasUnseen,
    );
  }
}
