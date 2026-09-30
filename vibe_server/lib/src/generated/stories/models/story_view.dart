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

abstract class StoryView
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = StoryViewTable();

  static const db = StoryViewRepository._();

  @override
  int? id;

  int storyId;

  _i1.UuidValue viewerId;

  DateTime viewedAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StoryView',
      if (id != null) 'id': id,
      'storyId': storyId,
      'viewerId': viewerId.toJson(),
      'viewedAt': viewedAt.toJson(),
    };
  }

  static StoryViewInclude include() {
    return StoryViewInclude._();
  }

  static StoryViewIncludeList includeList({
    _i1.WhereExpressionBuilder<StoryViewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoryViewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoryViewTable>? orderByList,
    StoryViewInclude? include,
  }) {
    return StoryViewIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StoryView.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StoryView.t),
      include: include,
    );
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

class StoryViewUpdateTable extends _i1.UpdateTable<StoryViewTable> {
  StoryViewUpdateTable(super.table);

  _i1.ColumnValue<int, int> storyId(int value) => _i1.ColumnValue(
    table.storyId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> viewerId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.viewerId,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> viewedAt(DateTime value) =>
      _i1.ColumnValue(
        table.viewedAt,
        value,
      );
}

class StoryViewTable extends _i1.Table<int?> {
  StoryViewTable({super.tableRelation}) : super(tableName: 'story_view') {
    updateTable = StoryViewUpdateTable(this);
    storyId = _i1.ColumnInt(
      'storyId',
      this,
    );
    viewerId = _i1.ColumnUuid(
      'viewerId',
      this,
    );
    viewedAt = _i1.ColumnDateTime(
      'viewedAt',
      this,
      hasDefault: true,
    );
  }

  late final StoryViewUpdateTable updateTable;

  late final _i1.ColumnInt storyId;

  late final _i1.ColumnUuid viewerId;

  late final _i1.ColumnDateTime viewedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    storyId,
    viewerId,
    viewedAt,
  ];
}

class StoryViewInclude extends _i1.IncludeObject {
  StoryViewInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => StoryView.t;
}

class StoryViewIncludeList extends _i1.IncludeList {
  StoryViewIncludeList._({
    _i1.WhereExpressionBuilder<StoryViewTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StoryView.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => StoryView.t;
}

class StoryViewRepository {
  const StoryViewRepository._();

  /// Returns a list of [StoryView]s matching the given query parameters.
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
  Future<List<StoryView>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoryViewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoryViewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoryViewTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StoryView>(
      where: where?.call(StoryView.t),
      orderBy: orderBy?.call(StoryView.t),
      orderByList: orderByList?.call(StoryView.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StoryView] matching the given query parameters.
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
  Future<StoryView?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoryViewTable>? where,
    int? offset,
    _i1.OrderByBuilder<StoryViewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoryViewTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StoryView>(
      where: where?.call(StoryView.t),
      orderBy: orderBy?.call(StoryView.t),
      orderByList: orderByList?.call(StoryView.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StoryView] by its [id] or null if no such row exists.
  Future<StoryView?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StoryView>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StoryView]s in the list and returns the inserted rows.
  ///
  /// The returned [StoryView]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<StoryView>> insert(
    _i1.DatabaseSession session,
    List<StoryView> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<StoryView>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [StoryView] and returns the inserted row.
  ///
  /// The returned [StoryView] will have its `id` field set.
  Future<StoryView> insertRow(
    _i1.DatabaseSession session,
    StoryView row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StoryView>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StoryView]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StoryView>> update(
    _i1.DatabaseSession session,
    List<StoryView> rows, {
    _i1.ColumnSelections<StoryViewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StoryView>(
      rows,
      columns: columns?.call(StoryView.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StoryView]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StoryView> updateRow(
    _i1.DatabaseSession session,
    StoryView row, {
    _i1.ColumnSelections<StoryViewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StoryView>(
      row,
      columns: columns?.call(StoryView.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StoryView] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StoryView?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<StoryViewUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StoryView>(
      id,
      columnValues: columnValues(StoryView.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StoryView]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StoryView>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<StoryViewUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StoryViewTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoryViewTable>? orderBy,
    _i1.OrderByListBuilder<StoryViewTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StoryView>(
      columnValues: columnValues(StoryView.t.updateTable),
      where: where(StoryView.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StoryView.t),
      orderByList: orderByList?.call(StoryView.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StoryView]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StoryView>> delete(
    _i1.DatabaseSession session,
    List<StoryView> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StoryView>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StoryView].
  Future<StoryView> deleteRow(
    _i1.DatabaseSession session,
    StoryView row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StoryView>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StoryView>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StoryViewTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StoryView>(
      where: where(StoryView.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StoryViewTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StoryView>(
      where: where?.call(StoryView.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StoryView] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StoryViewTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StoryView>(
      where: where(StoryView.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
