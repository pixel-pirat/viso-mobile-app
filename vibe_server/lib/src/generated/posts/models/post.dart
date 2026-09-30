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

/// A post created by a user, optionally with photo/video attachments.
abstract class Post implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = PostTable();

  static const db = PostRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static PostInclude include() {
    return PostInclude._();
  }

  static PostIncludeList includeList({
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    PostInclude? include,
  }) {
    return PostIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Post.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Post.t),
      include: include,
    );
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

class PostUpdateTable extends _i1.UpdateTable<PostTable> {
  PostUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.authorId,
        value,
      );

  _i1.ColumnValue<String, String> text(String value) => _i1.ColumnValue(
    table.text,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> mediaUrls(List<String> value) =>
      _i1.ColumnValue(
        table.mediaUrls,
        value,
      );

  _i1.ColumnValue<String, String> mediaType(String value) => _i1.ColumnValue(
    table.mediaType,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<int, int> likeCount(int value) => _i1.ColumnValue(
    table.likeCount,
    value,
  );

  _i1.ColumnValue<int, int> commentCount(int value) => _i1.ColumnValue(
    table.commentCount,
    value,
  );

  _i1.ColumnValue<int, int> viewCount(int value) => _i1.ColumnValue(
    table.viewCount,
    value,
  );
}

class PostTable extends _i1.Table<int?> {
  PostTable({super.tableRelation}) : super(tableName: 'post') {
    updateTable = PostUpdateTable(this);
    authorId = _i1.ColumnUuid(
      'authorId',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    mediaUrls = _i1.ColumnSerializable<List<String>>(
      'mediaUrls',
      this,
    );
    mediaType = _i1.ColumnString(
      'mediaType',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    likeCount = _i1.ColumnInt(
      'likeCount',
      this,
      hasDefault: true,
    );
    commentCount = _i1.ColumnInt(
      'commentCount',
      this,
      hasDefault: true,
    );
    viewCount = _i1.ColumnInt(
      'viewCount',
      this,
      hasDefault: true,
    );
  }

  late final PostUpdateTable updateTable;

  late final _i1.ColumnUuid authorId;

  late final _i1.ColumnString text;

  /// Public URLs of attached media (from MediaEndpoint.upload).
  late final _i1.ColumnSerializable<List<String>> mediaUrls;

  /// 'none', 'image' or 'video'.
  late final _i1.ColumnString mediaType;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt likeCount;

  late final _i1.ColumnInt commentCount;

  late final _i1.ColumnInt viewCount;

  @override
  List<_i1.Column> get columns => [
    id,
    authorId,
    text,
    mediaUrls,
    mediaType,
    createdAt,
    likeCount,
    commentCount,
    viewCount,
  ];
}

class PostInclude extends _i1.IncludeObject {
  PostInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Post.t;
}

class PostIncludeList extends _i1.IncludeList {
  PostIncludeList._({
    _i1.WhereExpressionBuilder<PostTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Post.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Post.t;
}

class PostRepository {
  const PostRepository._();

  /// Returns a list of [Post]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Post>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Post>(
      where: where?.call(Post.t),
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Post] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Post?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Post>(
      where: where?.call(Post.t),
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Post] by its [id] or null if no such row exists.
  Future<Post?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Post>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Post]s in the list and returns the inserted rows.
  ///
  /// The returned [Post]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Post>> insert(
    _i1.DatabaseSession session,
    List<Post> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Post>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Post] and returns the inserted row.
  ///
  /// The returned [Post] will have its `id` field set.
  Future<Post> insertRow(
    _i1.DatabaseSession session,
    Post row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Post>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Post]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Post>> update(
    _i1.DatabaseSession session,
    List<Post> rows, {
    _i1.ColumnSelections<PostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Post>(
      rows,
      columns: columns?.call(Post.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Post]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Post> updateRow(
    _i1.DatabaseSession session,
    Post row, {
    _i1.ColumnSelections<PostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Post>(
      row,
      columns: columns?.call(Post.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Post] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Post?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<PostUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Post>(
      id,
      columnValues: columnValues(Post.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Post]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Post>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<PostUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PostTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Post>(
      columnValues: columnValues(Post.t.updateTable),
      where: where(Post.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Post]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Post>> delete(
    _i1.DatabaseSession session,
    List<Post> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Post>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Post].
  Future<Post> deleteRow(
    _i1.DatabaseSession session,
    Post row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Post>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Post>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PostTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Post>(
      where: where(Post.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Post>(
      where: where?.call(Post.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Post] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PostTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Post>(
      where: where(Post.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
