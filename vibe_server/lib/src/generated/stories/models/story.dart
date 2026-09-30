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

abstract class Story implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = StoryTable();

  static const db = StoryRepository._();

  @override
  int? id;

  _i1.UuidValue authorId;

  String mediaUrl;

  String mediaType;

  DateTime createdAt;

  DateTime expiresAt;

  int viewCount;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static StoryInclude include() {
    return StoryInclude._();
  }

  static StoryIncludeList includeList({
    _i1.WhereExpressionBuilder<StoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoryTable>? orderByList,
    StoryInclude? include,
  }) {
    return StoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Story.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Story.t),
      include: include,
    );
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

class StoryUpdateTable extends _i1.UpdateTable<StoryTable> {
  StoryUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.authorId,
        value,
      );

  _i1.ColumnValue<String, String> mediaUrl(String value) => _i1.ColumnValue(
    table.mediaUrl,
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

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<int, int> viewCount(int value) => _i1.ColumnValue(
    table.viewCount,
    value,
  );
}

class StoryTable extends _i1.Table<int?> {
  StoryTable({super.tableRelation}) : super(tableName: 'story') {
    updateTable = StoryUpdateTable(this);
    authorId = _i1.ColumnUuid(
      'authorId',
      this,
    );
    mediaUrl = _i1.ColumnString(
      'mediaUrl',
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
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    viewCount = _i1.ColumnInt(
      'viewCount',
      this,
      hasDefault: true,
    );
  }

  late final StoryUpdateTable updateTable;

  late final _i1.ColumnUuid authorId;

  late final _i1.ColumnString mediaUrl;

  late final _i1.ColumnString mediaType;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnInt viewCount;

  @override
  List<_i1.Column> get columns => [
    id,
    authorId,
    mediaUrl,
    mediaType,
    createdAt,
    expiresAt,
    viewCount,
  ];
}

class StoryInclude extends _i1.IncludeObject {
  StoryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Story.t;
}

class StoryIncludeList extends _i1.IncludeList {
  StoryIncludeList._({
    _i1.WhereExpressionBuilder<StoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Story.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Story.t;
}

class StoryRepository {
  const StoryRepository._();

  /// Returns a list of [Story]s matching the given query parameters.
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
  Future<List<Story>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoryTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Story>(
      where: where?.call(Story.t),
      orderBy: orderBy?.call(Story.t),
      orderByList: orderByList?.call(Story.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Story] matching the given query parameters.
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
  Future<Story?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<StoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoryTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Story>(
      where: where?.call(Story.t),
      orderBy: orderBy?.call(Story.t),
      orderByList: orderByList?.call(Story.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Story] by its [id] or null if no such row exists.
  Future<Story?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Story>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Story]s in the list and returns the inserted rows.
  ///
  /// The returned [Story]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Story>> insert(
    _i1.DatabaseSession session,
    List<Story> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Story>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Story] and returns the inserted row.
  ///
  /// The returned [Story] will have its `id` field set.
  Future<Story> insertRow(
    _i1.DatabaseSession session,
    Story row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Story>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Story]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Story>> update(
    _i1.DatabaseSession session,
    List<Story> rows, {
    _i1.ColumnSelections<StoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Story>(
      rows,
      columns: columns?.call(Story.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Story]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Story> updateRow(
    _i1.DatabaseSession session,
    Story row, {
    _i1.ColumnSelections<StoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Story>(
      row,
      columns: columns?.call(Story.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Story] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Story?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<StoryUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Story>(
      id,
      columnValues: columnValues(Story.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Story]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Story>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<StoryUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StoryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoryTable>? orderBy,
    _i1.OrderByListBuilder<StoryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Story>(
      columnValues: columnValues(Story.t.updateTable),
      where: where(Story.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Story.t),
      orderByList: orderByList?.call(Story.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Story]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Story>> delete(
    _i1.DatabaseSession session,
    List<Story> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Story>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Story].
  Future<Story> deleteRow(
    _i1.DatabaseSession session,
    Story row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Story>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Story>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Story>(
      where: where(Story.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Story>(
      where: where?.call(Story.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Story] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StoryTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Story>(
      where: where(Story.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
