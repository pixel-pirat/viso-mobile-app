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
import 'package:vibe_server/src/generated/protocol.dart' as _i2;

/// A post with its author's real profile info and the signed-in user's
/// relationship to it (liked or not), ready for display.
abstract class PostFeedItem
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PostFeedItem._({
    required this.id,
    required this.authorId,
    required this.authorName,
    this.authorUserName,
    this.authorAvatarUrl,
    required this.text,
    required this.mediaUrls,
    required this.mediaType,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.viewCount,
    required this.isLikedByMe,
  });

  factory PostFeedItem({
    required int id,
    required _i1.UuidValue authorId,
    required String authorName,
    String? authorUserName,
    String? authorAvatarUrl,
    required String text,
    required List<String> mediaUrls,
    required String mediaType,
    required DateTime createdAt,
    required int likeCount,
    required int commentCount,
    required int viewCount,
    required bool isLikedByMe,
  }) = _PostFeedItemImpl;

  factory PostFeedItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostFeedItem(
      id: jsonSerialization['id'] as int,
      authorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authorId'],
      ),
      authorName: jsonSerialization['authorName'] as String,
      authorUserName: jsonSerialization['authorUserName'] as String?,
      authorAvatarUrl: jsonSerialization['authorAvatarUrl'] as String?,
      text: jsonSerialization['text'] as String,
      mediaUrls: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['mediaUrls'],
      ),
      mediaType: jsonSerialization['mediaType'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      likeCount: jsonSerialization['likeCount'] as int,
      commentCount: jsonSerialization['commentCount'] as int,
      viewCount: jsonSerialization['viewCount'] as int,
      isLikedByMe: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isLikedByMe'],
      ),
    );
  }

  int id;

  _i1.UuidValue authorId;

  String authorName;

  String? authorUserName;

  String? authorAvatarUrl;

  String text;

  List<String> mediaUrls;

  String mediaType;

  DateTime createdAt;

  int likeCount;

  int commentCount;

  int viewCount;

  bool isLikedByMe;

  /// Returns a shallow copy of this [PostFeedItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostFeedItem copyWith({
    int? id,
    _i1.UuidValue? authorId,
    String? authorName,
    String? authorUserName,
    String? authorAvatarUrl,
    String? text,
    List<String>? mediaUrls,
    String? mediaType,
    DateTime? createdAt,
    int? likeCount,
    int? commentCount,
    int? viewCount,
    bool? isLikedByMe,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostFeedItem',
      'id': id,
      'authorId': authorId.toJson(),
      'authorName': authorName,
      if (authorUserName != null) 'authorUserName': authorUserName,
      if (authorAvatarUrl != null) 'authorAvatarUrl': authorAvatarUrl,
      'text': text,
      'mediaUrls': mediaUrls.toJson(),
      'mediaType': mediaType,
      'createdAt': createdAt.toJson(),
      'likeCount': likeCount,
      'commentCount': commentCount,
      'viewCount': viewCount,
      'isLikedByMe': isLikedByMe,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostFeedItem',
      'id': id,
      'authorId': authorId.toJson(),
      'authorName': authorName,
      if (authorUserName != null) 'authorUserName': authorUserName,
      if (authorAvatarUrl != null) 'authorAvatarUrl': authorAvatarUrl,
      'text': text,
      'mediaUrls': mediaUrls.toJson(),
      'mediaType': mediaType,
      'createdAt': createdAt.toJson(),
      'likeCount': likeCount,
      'commentCount': commentCount,
      'viewCount': viewCount,
      'isLikedByMe': isLikedByMe,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostFeedItemImpl extends PostFeedItem {
  _PostFeedItemImpl({
    required int id,
    required _i1.UuidValue authorId,
    required String authorName,
    String? authorUserName,
    String? authorAvatarUrl,
    required String text,
    required List<String> mediaUrls,
    required String mediaType,
    required DateTime createdAt,
    required int likeCount,
    required int commentCount,
    required int viewCount,
    required bool isLikedByMe,
  }) : super._(
         id: id,
         authorId: authorId,
         authorName: authorName,
         authorUserName: authorUserName,
         authorAvatarUrl: authorAvatarUrl,
         text: text,
         mediaUrls: mediaUrls,
         mediaType: mediaType,
         createdAt: createdAt,
         likeCount: likeCount,
         commentCount: commentCount,
         viewCount: viewCount,
         isLikedByMe: isLikedByMe,
       );

  /// Returns a shallow copy of this [PostFeedItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostFeedItem copyWith({
    int? id,
    _i1.UuidValue? authorId,
    String? authorName,
    Object? authorUserName = _Undefined,
    Object? authorAvatarUrl = _Undefined,
    String? text,
    List<String>? mediaUrls,
    String? mediaType,
    DateTime? createdAt,
    int? likeCount,
    int? commentCount,
    int? viewCount,
    bool? isLikedByMe,
  }) {
    return PostFeedItem(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      authorUserName: authorUserName is String?
          ? authorUserName
          : this.authorUserName,
      authorAvatarUrl: authorAvatarUrl is String?
          ? authorAvatarUrl
          : this.authorAvatarUrl,
      text: text ?? this.text,
      mediaUrls: mediaUrls ?? this.mediaUrls.map((e0) => e0).toList(),
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      viewCount: viewCount ?? this.viewCount,
      isLikedByMe: isLikedByMe ?? this.isLikedByMe,
    );
  }
}
