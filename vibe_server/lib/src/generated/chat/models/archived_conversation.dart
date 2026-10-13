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

/// [userId] has archived their conversation with [archivedUserId] —
/// it's hidden from their main chat list until unarchived.
abstract class ArchivedConversation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArchivedConversation._({
    this.id,
    required this.userId,
    required this.archivedUserId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ArchivedConversation({
    int? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue archivedUserId,
    DateTime? createdAt,
  }) = _ArchivedConversationImpl;

  factory ArchivedConversation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ArchivedConversation(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      archivedUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['archivedUserId'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ArchivedConversationTable();

  static const db = ArchivedConversationRepository._();

  @override
  int? id;

  _i1.UuidValue userId;

  _i1.UuidValue archivedUserId;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArchivedConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArchivedConversation copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i1.UuidValue? archivedUserId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ArchivedConversation',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'archivedUserId': archivedUserId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ArchivedConversation',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'archivedUserId': archivedUserId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static ArchivedConversationInclude include() {
    return ArchivedConversationInclude._();
  }

  static ArchivedConversationIncludeList includeList({
    _i1.WhereExpressionBuilder<ArchivedConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArchivedConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArchivedConversationTable>? orderByList,
    ArchivedConversationInclude? include,
  }) {
    return ArchivedConversationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArchivedConversation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArchivedConversation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArchivedConversationImpl extends ArchivedConversation {
  _ArchivedConversationImpl({
    int? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue archivedUserId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         archivedUserId: archivedUserId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ArchivedConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArchivedConversation copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    _i1.UuidValue? archivedUserId,
    DateTime? createdAt,
  }) {
    return ArchivedConversation(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      archivedUserId: archivedUserId ?? this.archivedUserId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ArchivedConversationUpdateTable
    extends _i1.UpdateTable<ArchivedConversationTable> {
  ArchivedConversationUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> archivedUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.archivedUserId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ArchivedConversationTable extends _i1.Table<int?> {
  ArchivedConversationTable({super.tableRelation})
    : super(tableName: 'archived_conversation') {
    updateTable = ArchivedConversationUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    archivedUserId = _i1.ColumnUuid(
      'archivedUserId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final ArchivedConversationUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnUuid archivedUserId;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    archivedUserId,
    createdAt,
  ];
}

class ArchivedConversationInclude extends _i1.IncludeObject {
  ArchivedConversationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ArchivedConversation.t;
}

class ArchivedConversationIncludeList extends _i1.IncludeList {
  ArchivedConversationIncludeList._({
    _i1.WhereExpressionBuilder<ArchivedConversationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArchivedConversation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArchivedConversation.t;
}

class ArchivedConversationRepository {
  const ArchivedConversationRepository._();

  /// Returns a list of [ArchivedConversation]s matching the given query parameters.
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
  Future<List<ArchivedConversation>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ArchivedConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArchivedConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArchivedConversationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ArchivedConversation>(
      where: where?.call(ArchivedConversation.t),
      orderBy: orderBy?.call(ArchivedConversation.t),
      orderByList: orderByList?.call(ArchivedConversation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ArchivedConversation] matching the given query parameters.
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
  Future<ArchivedConversation?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ArchivedConversationTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArchivedConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArchivedConversationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ArchivedConversation>(
      where: where?.call(ArchivedConversation.t),
      orderBy: orderBy?.call(ArchivedConversation.t),
      orderByList: orderByList?.call(ArchivedConversation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ArchivedConversation] by its [id] or null if no such row exists.
  Future<ArchivedConversation?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ArchivedConversation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ArchivedConversation]s in the list and returns the inserted rows.
  ///
  /// The returned [ArchivedConversation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<ArchivedConversation>> insert(
    _i1.DatabaseSession session,
    List<ArchivedConversation> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<ArchivedConversation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [ArchivedConversation] and returns the inserted row.
  ///
  /// The returned [ArchivedConversation] will have its `id` field set.
  Future<ArchivedConversation> insertRow(
    _i1.DatabaseSession session,
    ArchivedConversation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArchivedConversation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArchivedConversation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArchivedConversation>> update(
    _i1.DatabaseSession session,
    List<ArchivedConversation> rows, {
    _i1.ColumnSelections<ArchivedConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArchivedConversation>(
      rows,
      columns: columns?.call(ArchivedConversation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArchivedConversation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArchivedConversation> updateRow(
    _i1.DatabaseSession session,
    ArchivedConversation row, {
    _i1.ColumnSelections<ArchivedConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArchivedConversation>(
      row,
      columns: columns?.call(ArchivedConversation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArchivedConversation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ArchivedConversation?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ArchivedConversationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ArchivedConversation>(
      id,
      columnValues: columnValues(ArchivedConversation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ArchivedConversation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ArchivedConversation>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ArchivedConversationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ArchivedConversationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArchivedConversationTable>? orderBy,
    _i1.OrderByListBuilder<ArchivedConversationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ArchivedConversation>(
      columnValues: columnValues(ArchivedConversation.t.updateTable),
      where: where(ArchivedConversation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArchivedConversation.t),
      orderByList: orderByList?.call(ArchivedConversation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ArchivedConversation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArchivedConversation>> delete(
    _i1.DatabaseSession session,
    List<ArchivedConversation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArchivedConversation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArchivedConversation].
  Future<ArchivedConversation> deleteRow(
    _i1.DatabaseSession session,
    ArchivedConversation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArchivedConversation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArchivedConversation>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ArchivedConversationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArchivedConversation>(
      where: where(ArchivedConversation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ArchivedConversationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArchivedConversation>(
      where: where?.call(ArchivedConversation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ArchivedConversation] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ArchivedConversationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ArchivedConversation>(
      where: where(ArchivedConversation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
