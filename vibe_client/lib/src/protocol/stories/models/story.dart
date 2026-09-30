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

abstract class Story implements _i1.SerializableModel {
  Story._({
    this.id,
    required this.authorId,
    required this.mediaUrl,
    required this.mediaType,
    DateTime? createdAt,
    required this.expiresAt,
    int? viewCount,
  }) : createdAt = createdAt ?? DateTime.now(),
       viewCount = viewCount ?? 0;

  factory Story({
    int? id,
    required _i1.UuidValue authorId,
    required String mediaUrl,
    required String mediaType,
    DateTime? createdAt,
    required DateTime expiresAt,
    int? viewCount,
  }) = _StoryImpl;

  factory Story.fromJson(Map<String, dynamic> jsonSerialization) {
    return Story(
      id: jsonSerialization['id'] as int?,
      authorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authorId'],
      ),
      mediaUrl: jsonSerialization['mediaUrl'] as String,
      mediaType: jsonSerialization['mediaType'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      viewCount: jsonSerialization['viewCount'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue authorId;

  String mediaUrl;

  String mediaType;

  DateTime createdAt;

  DateTime expiresAt;

  int viewCount;

  /// Returns a shallow copy of this [Story]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Story copyWith({
    int? id,
    _i1.UuidValue? authorId,
    String? mediaUrl,
    String? mediaType,
    DateTime? createdAt,
    DateTime? expiresAt,
    int? viewCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Story',
      if (id != null) 'id': id,
      'authorId': authorId.toJson(),
      'mediaUrl': mediaUrl,
      'mediaType': mediaType,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      'viewCount': viewCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoryImpl extends Story {
  _StoryImpl({
    int? id,
    required _i1.UuidValue authorId,
    required String mediaUrl,
    required String mediaType,
    DateTime? createdAt,
    required DateTime expiresAt,
    int? viewCount,
  }) : super._(
         id: id,
         authorId: authorId,
         mediaUrl: mediaUrl,
         mediaType: mediaType,
         createdAt: createdAt,
         expiresAt: expiresAt,
         viewCount: viewCount,
       );

  /// Returns a shallow copy of this [Story]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Story copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authorId,
    String? mediaUrl,
    String? mediaType,
    DateTime? createdAt,
    DateTime? expiresAt,
    int? viewCount,
  }) {
    return Story(
      id: id is int? ? id : this.id,
      authorId: authorId ?? this.authorId,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      viewCount: viewCount ?? this.viewCount,
    );
  }
}
