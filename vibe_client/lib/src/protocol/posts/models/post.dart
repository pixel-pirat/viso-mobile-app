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
import 'package:vibe_client/src/protocol/protocol.dart' as _i2;

/// A post created by a user, optionally with photo/video attachments.
abstract class Post implements _i1.SerializableModel {
  Post._({
    this.id,
    required this.authorId,
    required this.text,
    required this.mediaUrls,
    required this.mediaType,
    DateTime? createdAt,
    int? likeCount,
    int? commentCount,
    int? viewCount,
  }) : createdAt = createdAt ?? DateTime.now(),
       likeCount = likeCount ?? 0,
       commentCount = commentCount ?? 0,
       viewCount = viewCount ?? 0;

  factory Post({
    int? id,
    required _i1.UuidValue authorId,
    required String text,
    required List<String> mediaUrls,
    required String mediaType,
    DateTime? createdAt,
    int? likeCount,
    int? commentCount,
    int? viewCount,
  }) = _PostImpl;

  factory Post.fromJson(Map<String, dynamic> jsonSerialization) {
    return Post(
      id: jsonSerialization['id'] as int?,
      authorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authorId'],
      ),
      text: jsonSerialization['text'] as String,
      mediaUrls: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['mediaUrls'],
      ),
      mediaType: jsonSerialization['mediaType'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      likeCount: jsonSerialization['likeCount'] as int?,
      commentCount: jsonSerialization['commentCount'] as int?,
      viewCount: jsonSerialization['viewCount'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue authorId;

  String text;

  /// Public URLs of attached media (from MediaEndpoint.upload).
  List<String> mediaUrls;

  /// 'none', 'image' or 'video'.
  String mediaType;

  DateTime createdAt;

  int likeCount;

  int commentCount;

  int viewCount;

  /// Returns a shallow copy of this [Post]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Post copyWith({
    int? id,
    _i1.UuidValue? authorId,
    String? text,
    List<String>? mediaUrls,
    String? mediaType,
    DateTime? createdAt,
    int? likeCount,
    int? commentCount,
    int? viewCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Post',
      if (id != null) 'id': id,
      'authorId': authorId.toJson(),
      'text': text,
      'mediaUrls': mediaUrls.toJson(),
      'mediaType': mediaType,
      'createdAt': createdAt.toJson(),
      'likeCount': likeCount,
      'commentCount': commentCount,
      'viewCount': viewCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostImpl extends Post {
  _PostImpl({
    int? id,
    required _i1.UuidValue authorId,
    required String text,
    required List<String> mediaUrls,
    required String mediaType,
    DateTime? createdAt,
    int? likeCount,
    int? commentCount,
    int? viewCount,
  }) : super._(
         id: id,
         authorId: authorId,
         text: text,
         mediaUrls: mediaUrls,
         mediaType: mediaType,
         createdAt: createdAt,
         likeCount: likeCount,
         commentCount: commentCount,
         viewCount: viewCount,
       );

  /// Returns a shallow copy of this [Post]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Post copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authorId,
    String? text,
    List<String>? mediaUrls,
    String? mediaType,
    DateTime? createdAt,
    int? likeCount,
    int? commentCount,
    int? viewCount,
  }) {
    return Post(
      id: id is int? ? id : this.id,
      authorId: authorId ?? this.authorId,
      text: text ?? this.text,
      mediaUrls: mediaUrls ?? this.mediaUrls.map((e0) => e0).toList(),
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      viewCount: viewCount ?? this.viewCount,
    );
  }
}
