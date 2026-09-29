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

/// Tracks when a user was last active, used to compute online/offline
/// status. Updated by a periodic heartbeat call from the app.
abstract class UserPresence
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserPresence._({
    this.id,
    required this.authUserId,
    DateTime? lastActiveAt,
  }) : lastActiveAt = lastActiveAt ?? DateTime.now();

  factory UserPresence({
    int? id,
    required _i1.UuidValue authUserId,
    DateTime? lastActiveAt,
  }) = _UserPresenceImpl;

  factory UserPresence.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserPresence(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      lastActiveAt: jsonSerialization['lastActiveAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActiveAt'],
            ),
    );
  }

  static final t = UserPresenceTable();

  static const db = UserPresenceRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  DateTime lastActiveAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserPresence]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserPresence copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    DateTime? lastActiveAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserPresence',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'lastActiveAt': lastActiveAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserPresence',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'lastActiveAt': lastActiveAt.toJson(),
    };
  }

  static UserPresenceInclude include() {
    return UserPresenceInclude._();
  }

  static UserPresenceIncludeList includeList({
    _i1.WhereExpressionBuilder<UserPresenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserPresenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserPresenceTable>? orderByList,
    UserPresenceInclude? include,
  }) {
    return UserPresenceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserPresence.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserPresence.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserPresenceImpl extends UserPresence {
  _UserPresenceImpl({
    int? id,
    required _i1.UuidValue authUserId,
    DateTime? lastActiveAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         lastActiveAt: lastActiveAt,
       );

  /// Returns a shallow copy of this [UserPresence]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserPresence copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    DateTime? lastActiveAt,
  }) {
    return UserPresence(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
    );
  }
}

class UserPresenceUpdateTable extends _i1.UpdateTable<UserPresenceTable> {
  UserPresenceUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastActiveAt(DateTime value) =>
      _i1.ColumnValue(
        table.lastActiveAt,
        value,
      );
}

class UserPresenceTable extends _i1.Table<int?> {
  UserPresenceTable({super.tableRelation}) : super(tableName: 'user_presence') {
    updateTable = UserPresenceUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    lastActiveAt = _i1.ColumnDateTime(
      'lastActiveAt',
      this,
      hasDefault: true,
    );
  }

  late final UserPresenceUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnDateTime lastActiveAt;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    lastActiveAt,
  ];
}

class UserPresenceInclude extends _i1.IncludeObject {
  UserPresenceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserPresence.t;
}

class UserPresenceIncludeList extends _i1.IncludeList {
  UserPresenceIncludeList._({
    _i1.WhereExpressionBuilder<UserPresenceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserPresence.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserPresence.t;
}

class UserPresenceRepository {
  const UserPresenceRepository._();

  /// Returns a list of [UserPresence]s matching the given query parameters.
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
  Future<List<UserPresence>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<UserPresenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserPresenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserPresenceTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<UserPresence>(
      where: where?.call(UserPresence.t),
      orderBy: orderBy?.call(UserPresence.t),
      orderByList: orderByList?.call(UserPresence.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [UserPresence] matching the given query parameters.
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
  Future<UserPresence?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<UserPresenceTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserPresenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserPresenceTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<UserPresence>(
      where: where?.call(UserPresence.t),
      orderBy: orderBy?.call(UserPresence.t),
      orderByList: orderByList?.call(UserPresence.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [UserPresence] by its [id] or null if no such row exists.
  Future<UserPresence?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<UserPresence>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [UserPresence]s in the list and returns the inserted rows.
  ///
  /// The returned [UserPresence]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<UserPresence>> insert(
    _i1.DatabaseSession session,
    List<UserPresence> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<UserPresence>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [UserPresence] and returns the inserted row.
  ///
  /// The returned [UserPresence] will have its `id` field set.
  Future<UserPresence> insertRow(
    _i1.DatabaseSession session,
    UserPresence row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserPresence>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserPresence]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserPresence>> update(
    _i1.DatabaseSession session,
    List<UserPresence> rows, {
    _i1.ColumnSelections<UserPresenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserPresence>(
      rows,
      columns: columns?.call(UserPresence.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserPresence]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserPresence> updateRow(
    _i1.DatabaseSession session,
    UserPresence row, {
    _i1.ColumnSelections<UserPresenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserPresence>(
      row,
      columns: columns?.call(UserPresence.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserPresence] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserPresence?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<UserPresenceUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserPresence>(
      id,
      columnValues: columnValues(UserPresence.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserPresence]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserPresence>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<UserPresenceUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserPresenceTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserPresenceTable>? orderBy,
    _i1.OrderByListBuilder<UserPresenceTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserPresence>(
      columnValues: columnValues(UserPresence.t.updateTable),
      where: where(UserPresence.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserPresence.t),
      orderByList: orderByList?.call(UserPresence.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserPresence]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserPresence>> delete(
    _i1.DatabaseSession session,
    List<UserPresence> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserPresence>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserPresence].
  Future<UserPresence> deleteRow(
    _i1.DatabaseSession session,
    UserPresence row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserPresence>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserPresence>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<UserPresenceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserPresence>(
      where: where(UserPresence.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<UserPresenceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserPresence>(
      where: where?.call(UserPresence.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [UserPresence] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<UserPresenceTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<UserPresence>(
      where: where(UserPresence.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
