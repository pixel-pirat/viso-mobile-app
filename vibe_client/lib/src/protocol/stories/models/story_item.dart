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

abstract class StoryItem implements _i1.SerializableModel {
  StoryItem._({
    required this.id,
    required this.mediaUrl,
    required this.mediaType,
    required this.createdAt,
    required this.viewCount,
    required this.isSeenByMe,
  });

  factory StoryItem({
    required int id,
    required String mediaUrl,
    required String mediaType,
    required DateTime createdAt,
    required int viewCount,
    required bool isSeenByMe,
  }) = _StoryItemImpl;

  factory StoryItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoryItem(
      id: jsonSerialization['id'] as int,
      mediaUrl: jsonSerialization['mediaUrl'] as String,
      mediaType: jsonSerialization['mediaType'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      viewCount: jsonSerialization['viewCount'] as int,
      isSeenByMe: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isSeenByMe'],
      ),
    );
  }

  int id;

  String mediaUrl;

  String mediaType;

  DateTime createdAt;

  int viewCount;

  bool isSeenByMe;

  /// Returns a shallow copy of this [StoryItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoryItem copyWith({
    int? id,
    String? mediaUrl,
    String? mediaType,
    DateTime? createdAt,
    int? viewCount,
    bool? isSeenByMe,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoryItem',
      'id': id,
      'mediaUrl': mediaUrl,
      'mediaType': mediaType,
      'createdAt': createdAt.toJson(),
      'viewCount': viewCount,
      'isSeenByMe': isSeenByMe,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StoryItemImpl extends StoryItem {
  _StoryItemImpl({
    required int id,
    required String mediaUrl,
    required String mediaType,
    required DateTime createdAt,
    required int viewCount,
    required bool isSeenByMe,
  }) : super._(
         id: id,
         mediaUrl: mediaUrl,
         mediaType: mediaType,
         createdAt: createdAt,
         viewCount: viewCount,
         isSeenByMe: isSeenByMe,
       );

  /// Returns a shallow copy of this [StoryItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoryItem copyWith({
    int? id,
    String? mediaUrl,
    String? mediaType,
    DateTime? createdAt,
    int? viewCount,
    bool? isSeenByMe,
  }) {
    return StoryItem(
      id: id ?? this.id,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
      viewCount: viewCount ?? this.viewCount,
      isSeenByMe: isSeenByMe ?? this.isSeenByMe,
    );
  }
}
