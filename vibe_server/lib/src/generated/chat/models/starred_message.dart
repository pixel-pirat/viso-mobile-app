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

/// [userId] has starred [messageId] for quick reference later.
abstract class StarredMessage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  StarredMessage._({
    this.id,
    required this.userId,
    required this.messageId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory StarredMessage({
    int? id,
    required _i1.UuidValue userId,
    required int messageId,
    DateTime? createdAt,
  }) = _StarredMessageImpl;

  factory StarredMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return StarredMessage(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      messageId: jsonSerialization['messageId'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = StarredMessageTable();

  static const db = StarredMessageRepository._();

  @override
  int? id;

  _i1.UuidValue userId;

  int messageId;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [StarredMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StarredMessage copyWith({
    int? id,
    _i1.UuidValue? userId,
    int? messageId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StarredMessage',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'messageId': messageId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StarredMessage',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'messageId': messageId,
      'createdAt': createdAt.toJson(),
    };
  }

  static StarredMessageInclude include() {
    return StarredMessageInclude._();
  }

  static StarredMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<StarredMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StarredMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StarredMessageTable>? orderByList,
    StarredMessageInclude? include,
  }) {
    return StarredMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StarredMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StarredMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StarredMessageImpl extends StarredMessage {
  _StarredMessageImpl({
    int? id,
    required _i1.UuidValue userId,
    required int messageId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         messageId: messageId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [StarredMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StarredMessage copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    int? messageId,
    DateTime? createdAt,
  }) {
    return StarredMessage(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      messageId: messageId ?? this.messageId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class StarredMessageUpdateTable extends _i1.UpdateTable<StarredMessageTable> {
  StarredMessageUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<int, int> messageId(int value) => _i1.ColumnValue(
    table.messageId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class StarredMessageTable extends _i1.Table<int?> {
  StarredMessageTable({super.tableRelation})
    : super(tableName: 'starred_message') {
    updateTable = StarredMessageUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    messageId = _i1.ColumnInt(
      'messageId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final StarredMessageUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnInt messageId;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    messageId,
    createdAt,
  ];
}

class StarredMessageInclude extends _i1.IncludeObject {
  StarredMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => StarredMessage.t;
}

class StarredMessageIncludeList extends _i1.IncludeList {
  StarredMessageIncludeList._({
    _i1.WhereExpressionBuilder<StarredMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StarredMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => StarredMessage.t;
}

class StarredMessageRepository {
  const StarredMessageRepository._();

  /// Returns a list of [StarredMessage]s matching the given query parameters.
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
  Future<List<StarredMessage>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StarredMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StarredMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StarredMessageTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StarredMessage>(
      where: where?.call(StarredMessage.t),
      orderBy: orderBy?.call(StarredMessage.t),
      orderByList: orderByList?.call(StarredMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StarredMessage] matching the given query parameters.
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
  Future<StarredMessage?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StarredMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<StarredMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StarredMessageTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StarredMessage>(
      where: where?.call(StarredMessage.t),
      orderBy: orderBy?.call(StarredMessage.t),
      orderByList: orderByList?.call(StarredMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StarredMessage] by its [id] or null if no such row exists.
  Future<StarredMessage?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StarredMessage>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StarredMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [StarredMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<StarredMessage>> insert(
    _i1.DatabaseSession session,
    List<StarredMessage> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<StarredMessage>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [StarredMessage] and returns the inserted row.
  ///
  /// The returned [StarredMessage] will have its `id` field set.
  Future<StarredMessage> insertRow(
    _i1.DatabaseSession session,
    StarredMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StarredMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StarredMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StarredMessage>> update(
    _i1.DatabaseSession session,
    List<StarredMessage> rows, {
    _i1.ColumnSelections<StarredMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StarredMessage>(
      rows,
      columns: columns?.call(StarredMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StarredMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StarredMessage> updateRow(
    _i1.DatabaseSession session,
    StarredMessage row, {
    _i1.ColumnSelections<StarredMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StarredMessage>(
      row,
      columns: columns?.call(StarredMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StarredMessage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StarredMessage?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<StarredMessageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StarredMessage>(
      id,
      columnValues: columnValues(StarredMessage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StarredMessage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StarredMessage>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<StarredMessageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StarredMessageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StarredMessageTable>? orderBy,
    _i1.OrderByListBuilder<StarredMessageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StarredMessage>(
      columnValues: columnValues(StarredMessage.t.updateTable),
      where: where(StarredMessage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StarredMessage.t),
      orderByList: orderByList?.call(StarredMessage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StarredMessage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StarredMessage>> delete(
    _i1.DatabaseSession session,
    List<StarredMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StarredMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StarredMessage].
  Future<StarredMessage> deleteRow(
    _i1.DatabaseSession session,
    StarredMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StarredMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StarredMessage>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StarredMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StarredMessage>(
      where: where(StarredMessage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StarredMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StarredMessage>(
      where: where?.call(StarredMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StarredMessage] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StarredMessageTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StarredMessage>(
      where: where(StarredMessage.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
