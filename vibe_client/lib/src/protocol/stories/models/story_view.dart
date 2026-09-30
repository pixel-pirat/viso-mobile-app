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

abstract class StoryView implements _i1.SerializableModel {
  StoryView._({
    this.id,
    required this.storyId,
    required this.viewerId,
    DateTime? viewedAt,
  }) : viewedAt = viewedAt ?? DateTime.now();

  factory StoryView({
    int? id,
    required int storyId,
    required _i1.UuidValue viewerId,
    DateTime? viewedAt,
  }) = _StoryViewImpl;

  factory StoryView.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoryView(
      id: jsonSerialization['id'] as int?,
      storyId: jsonSerialization['storyId'] as int,
      viewerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['viewerId'],
      ),
      viewedAt: jsonSerialization['viewedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['viewedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int storyId;

  _i1.UuidValue viewerId;

  DateTime viewedAt;

  /// Returns a shallow copy of this [StoryView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoryView copyWith({
    int? id,
    int? storyId,
    _i1.UuidValue? viewerId,
    DateTime? viewedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoryView',
      if (id != null) 'id': id,
      'storyId': storyId,
      'viewerId': viewerId.toJson(),
      'viewedAt': viewedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoryViewImpl extends StoryView {
  _StoryViewImpl({
    int? id,
    required int storyId,
    required _i1.UuidValue viewerId,
    DateTime? viewedAt,
  }) : super._(
         id: id,
         storyId: storyId,
         viewerId: viewerId,
         viewedAt: viewedAt,
       );

  /// Returns a shallow copy of this [StoryView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoryView copyWith({
    Object? id = _Undefined,
    int? storyId,
    _i1.UuidValue? viewerId,
    DateTime? viewedAt,
  }) {
    return StoryView(
      id: id is int? ? id : this.id,
      storyId: storyId ?? this.storyId,
      viewerId: viewerId ?? this.viewerId,
      viewedAt: viewedAt ?? this.viewedAt,
    );
  }
}
