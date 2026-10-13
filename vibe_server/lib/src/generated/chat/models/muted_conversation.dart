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

/// [userId] has muted push notifications for messages from
/// [mutedUserId]. Messages still arrive normally; only the push is
/// suppressed.
abstract class MutedConversation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MutedConversation._({
    this.id,
    required this.userId,
    required this.mutedUserId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory MutedConversation({
    int? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue mutedUserId,
    DateTime? createdAt,
  }) = _MutedConversationImpl;

  factory MutedConversation.fromJson(Map<String, dynamic> jsonSerialization) {
    return MutedConversation(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      mutedUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['mutedUserId'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = MutedConversationTable();

  static const db = MutedConversationRepository._();

  @override
  int? id;

  _i1.UuidValue userId;

  _i1.UuidValue mutedUserId;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MutedConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MutedConversation copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i1.UuidValue? mutedUserId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MutedConversation',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'mutedUserId': mutedUserId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MutedConversation',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'mutedUserId': mutedUserId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static MutedConversationInclude include() {
    return MutedConversationInclude._();
  }

  static MutedConversationIncludeList includeList({
    _i1.WhereExpressionBuilder<MutedConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MutedConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MutedConversationTable>? orderByList,
    MutedConversationInclude? include,
  }) {
    return MutedConversationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MutedConversation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MutedConversation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MutedConversationImpl extends MutedConversation {
  _MutedConversationImpl({
    int? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue mutedUserId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         mutedUserId: mutedUserId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [MutedConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MutedConversation copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    _i1.UuidValue? mutedUserId,
    DateTime? createdAt,
  }) {
    return MutedConversation(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      mutedUserId: mutedUserId ?? this.mutedUserId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class MutedConversationUpdateTable
    extends _i1.UpdateTable<MutedConversationTable> {
  MutedConversationUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> mutedUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.mutedUserId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class MutedConversationTable extends _i1.Table<int?> {
  MutedConversationTable({super.tableRelation})
    : super(tableName: 'muted_conversation') {
    updateTable = MutedConversationUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    mutedUserId = _i1.ColumnUuid(
      'mutedUserId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final MutedConversationUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnUuid mutedUserId;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    mutedUserId,
    createdAt,
  ];
}

class MutedConversationInclude extends _i1.IncludeObject {
  MutedConversationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MutedConversation.t;
}

class MutedConversationIncludeList extends _i1.IncludeList {
  MutedConversationIncludeList._({
    _i1.WhereExpressionBuilder<MutedConversationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MutedConversation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MutedConversation.t;
}

class MutedConversationRepository {
  const MutedConversationRepository._();

  /// Returns a list of [MutedConversation]s matching the given query parameters.
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
  Future<List<MutedConversation>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MutedConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MutedConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MutedConversationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<MutedConversation>(
      where: where?.call(MutedConversation.t),
      orderBy: orderBy?.call(MutedConversation.t),
      orderByList: orderByList?.call(MutedConversation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [MutedConversation] matching the given query parameters.
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
  Future<MutedConversation?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MutedConversationTable>? where,
    int? offset,
    _i1.OrderByBuilder<MutedConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MutedConversationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<MutedConversation>(
      where: where?.call(MutedConversation.t),
      orderBy: orderBy?.call(MutedConversation.t),
      orderByList: orderByList?.call(MutedConversation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [MutedConversation] by its [id] or null if no such row exists.
  Future<MutedConversation?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<MutedConversation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [MutedConversation]s in the list and returns the inserted rows.
  ///
  /// The returned [MutedConversation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<MutedConversation>> insert(
    _i1.DatabaseSession session,
    List<MutedConversation> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<MutedConversation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [MutedConversation] and returns the inserted row.
  ///
  /// The returned [MutedConversation] will have its `id` field set.
  Future<MutedConversation> insertRow(
    _i1.DatabaseSession session,
    MutedConversation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MutedConversation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MutedConversation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MutedConversation>> update(
    _i1.DatabaseSession session,
    List<MutedConversation> rows, {
    _i1.ColumnSelections<MutedConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MutedConversation>(
      rows,
      columns: columns?.call(MutedConversation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MutedConversation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MutedConversation> updateRow(
    _i1.DatabaseSession session,
    MutedConversation row, {
    _i1.ColumnSelections<MutedConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MutedConversation>(
      row,
      columns: columns?.call(MutedConversation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MutedConversation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MutedConversation?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<MutedConversationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MutedConversation>(
      id,
      columnValues: columnValues(MutedConversation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MutedConversation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MutedConversation>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<MutedConversationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MutedConversationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MutedConversationTable>? orderBy,
    _i1.OrderByListBuilder<MutedConversationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MutedConversation>(
      columnValues: columnValues(MutedConversation.t.updateTable),
      where: where(MutedConversation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MutedConversation.t),
      orderByList: orderByList?.call(MutedConversation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MutedConversation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MutedConversation>> delete(
    _i1.DatabaseSession session,
    List<MutedConversation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MutedConversation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MutedConversation].
  Future<MutedConversation> deleteRow(
    _i1.DatabaseSession session,
    MutedConversation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MutedConversation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MutedConversation>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MutedConversationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MutedConversation>(
      where: where(MutedConversation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MutedConversationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MutedConversation>(
      where: where?.call(MutedConversation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [MutedConversation] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MutedConversationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<MutedConversation>(
      where: where(MutedConversation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
