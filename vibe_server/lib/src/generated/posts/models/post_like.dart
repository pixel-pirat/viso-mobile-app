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

/// Tracks which users liked which posts, so likes can be toggled and
/// counted accurately per user.
abstract class PostLike
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostLike._({
    this.id,
    required this.postId,
    required this.userId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory PostLike({
    int? id,
    required int postId,
    required _i1.UuidValue userId,
    DateTime? createdAt,
  }) = _PostLikeImpl;

  factory PostLike.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostLike(
      id: jsonSerialization['id'] as int?,
      postId: jsonSerialization['postId'] as int,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = PostLikeTable();

  static const db = PostLikeRepository._();

  @override
  int? id;

  int postId;

  _i1.UuidValue userId;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostLike]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostLike copyWith({
    int? id,
    int? postId,
    _i1.UuidValue? userId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostLike',
      if (id != null) 'id': id,
      'postId': postId,
      'userId': userId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostLike',
      if (id != null) 'id': id,
      'postId': postId,
      'userId': userId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static PostLikeInclude include() {
    return PostLikeInclude._();
  }

  static PostLikeIncludeList includeList({
    _i1.WhereExpressionBuilder<PostLikeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostLikeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikeTable>? orderByList,
    PostLikeInclude? include,
  }) {
    return PostLikeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostLike.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostLike.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostLikeImpl extends PostLike {
  _PostLikeImpl({
    int? id,
    required int postId,
    required _i1.UuidValue userId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         postId: postId,
         userId: userId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PostLike]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostLike copyWith({
    Object? id = _Undefined,
    int? postId,
    _i1.UuidValue? userId,
    DateTime? createdAt,
  }) {
    return PostLike(
      id: id is int? ? id : this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class PostLikeUpdateTable extends _i1.UpdateTable<PostLikeTable> {
  PostLikeUpdateTable(super.table);

  _i1.ColumnValue<int, int> postId(int value) => _i1.ColumnValue(
    table.postId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class PostLikeTable extends _i1.Table<int?> {
  PostLikeTable({super.tableRelation}) : super(tableName: 'post_like') {
    updateTable = PostLikeUpdateTable(this);
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final PostLikeUpdateTable updateTable;

  late final _i1.ColumnInt postId;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    postId,
    userId,
    createdAt,
  ];
}

class PostLikeInclude extends _i1.IncludeObject {
  PostLikeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PostLike.t;
}

class PostLikeIncludeList extends _i1.IncludeList {
  PostLikeIncludeList._({
    _i1.WhereExpressionBuilder<PostLikeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostLike.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostLike.t;
}

class PostLikeRepository {
  const PostLikeRepository._();

  /// Returns a list of [PostLike]s matching the given query parameters.
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
  Future<List<PostLike>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PostLikeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostLikeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikeTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PostLike>(
      where: where?.call(PostLike.t),
      orderBy: orderBy?.call(PostLike.t),
      orderByList: orderByList?.call(PostLike.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PostLike] matching the given query parameters.
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
  Future<PostLike?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PostLikeTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostLikeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostLikeTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PostLike>(
      where: where?.call(PostLike.t),
      orderBy: orderBy?.call(PostLike.t),
      orderByList: orderByList?.call(PostLike.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PostLike] by its [id] or null if no such row exists.
  Future<PostLike?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PostLike>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PostLike]s in the list and returns the inserted rows.
  ///
  /// The returned [PostLike]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<PostLike>> insert(
    _i1.DatabaseSession session,
    List<PostLike> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<PostLike>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [PostLike] and returns the inserted row.
  ///
  /// The returned [PostLike] will have its `id` field set.
  Future<PostLike> insertRow(
    _i1.DatabaseSession session,
    PostLike row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostLike>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostLike]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostLike>> update(
    _i1.DatabaseSession session,
    List<PostLike> rows, {
    _i1.ColumnSelections<PostLikeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostLike>(
      rows,
      columns: columns?.call(PostLike.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostLike]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostLike> updateRow(
    _i1.DatabaseSession session,
    PostLike row, {
    _i1.ColumnSelections<PostLikeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostLike>(
      row,
      columns: columns?.call(PostLike.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostLike] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PostLike?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<PostLikeUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PostLike>(
      id,
      columnValues: columnValues(PostLike.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PostLike]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PostLike>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<PostLikeUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PostLikeTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostLikeTable>? orderBy,
    _i1.OrderByListBuilder<PostLikeTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PostLike>(
      columnValues: columnValues(PostLike.t.updateTable),
      where: where(PostLike.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostLike.t),
      orderByList: orderByList?.call(PostLike.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PostLike]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostLike>> delete(
    _i1.DatabaseSession session,
    List<PostLike> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostLike>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostLike].
  Future<PostLike> deleteRow(
    _i1.DatabaseSession session,
    PostLike row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostLike>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostLike>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PostLikeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostLike>(
      where: where(PostLike.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PostLikeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostLike>(
      where: where?.call(PostLike.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PostLike] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PostLikeTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PostLike>(
      where: where(PostLike.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
