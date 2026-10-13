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

/// A direct message between two users.
abstract class ChatMessage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ChatMessage._({
    this.id,
    required this.senderId,
    required this.recipientId,
    required this.text,
    this.mediaUrl,
    this.mediaType,
    this.replyToMessageId,
    DateTime? createdAt,
    this.deliveredAt,
    this.readAt,
    this.editedAt,
    this.deletedAt,
    this.hiddenForSender,
    this.hiddenForRecipient,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ChatMessage({
    int? id,
    required _i1.UuidValue senderId,
    required _i1.UuidValue recipientId,
    required String text,
    String? mediaUrl,
    String? mediaType,
    int? replyToMessageId,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    DateTime? hiddenForSender,
    DateTime? hiddenForRecipient,
  }) = _ChatMessageImpl;

  factory ChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChatMessage(
      id: jsonSerialization['id'] as int?,
      senderId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['senderId'],
      ),
      recipientId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['recipientId'],
      ),
      text: jsonSerialization['text'] as String,
      mediaUrl: jsonSerialization['mediaUrl'] as String?,
      mediaType: jsonSerialization['mediaType'] as String?,
      replyToMessageId: jsonSerialization['replyToMessageId'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      deliveredAt: jsonSerialization['deliveredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['deliveredAt'],
            ),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
      editedAt: jsonSerialization['editedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['editedAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      hiddenForSender: jsonSerialization['hiddenForSender'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['hiddenForSender'],
            ),
      hiddenForRecipient: jsonSerialization['hiddenForRecipient'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['hiddenForRecipient'],
            ),
    );
  }

  static final t = ChatMessageTable();

  static const db = ChatMessageRepository._();

  @override
  int? id;

  /// The auth user id of whoever sent this message.
  _i1.UuidValue senderId;

  /// The auth user id of whoever should receive this message.
  _i1.UuidValue recipientId;

  String text;

  /// Set when this message carries a photo/video/voice note/document
  /// instead of (or alongside) text.
  String? mediaUrl;

  String? mediaType;

  /// The message this one is replying to, if any.
  int? replyToMessageId;

  DateTime createdAt;

  /// Set the first time the recipient's client fetches this message.
  DateTime? deliveredAt;

  /// Set once the recipient has opened the conversation.
  DateTime? readAt;

  /// Set when the sender edits the text after sending.
  DateTime? editedAt;

  /// Set when the sender deletes this message for everyone. Text/media
  /// are cleared; the client renders a "message deleted" placeholder.
  DateTime? deletedAt;

  /// Set when the sender/recipient deletes this message for themselves
  /// only — the other party still sees it normally.
  DateTime? hiddenForSender;

  DateTime? hiddenForRecipient;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatMessage copyWith({
    int? id,
    _i1.UuidValue? senderId,
    _i1.UuidValue? recipientId,
    String? text,
    String? mediaUrl,
    String? mediaType,
    int? replyToMessageId,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    DateTime? hiddenForSender,
    DateTime? hiddenForRecipient,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChatMessage',
      if (id != null) 'id': id,
      'senderId': senderId.toJson(),
      'recipientId': recipientId.toJson(),
      'text': text,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
      if (mediaType != null) 'mediaType': mediaType,
      if (replyToMessageId != null) 'replyToMessageId': replyToMessageId,
      'createdAt': createdAt.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
      if (editedAt != null) 'editedAt': editedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (hiddenForSender != null) 'hiddenForSender': hiddenForSender?.toJson(),
      if (hiddenForRecipient != null)
        'hiddenForRecipient': hiddenForRecipient?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ChatMessage',
      if (id != null) 'id': id,
      'senderId': senderId.toJson(),
      'recipientId': recipientId.toJson(),
      'text': text,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
      if (mediaType != null) 'mediaType': mediaType,
      if (replyToMessageId != null) 'replyToMessageId': replyToMessageId,
      'createdAt': createdAt.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
      if (editedAt != null) 'editedAt': editedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (hiddenForSender != null) 'hiddenForSender': hiddenForSender?.toJson(),
      if (hiddenForRecipient != null)
        'hiddenForRecipient': hiddenForRecipient?.toJson(),
    };
  }

  static ChatMessageInclude include() {
    return ChatMessageInclude._();
  }

  static ChatMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatMessageTable>? orderByList,
    ChatMessageInclude? include,
  }) {
    return ChatMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChatMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ChatMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatMessageImpl extends ChatMessage {
  _ChatMessageImpl({
    int? id,
    required _i1.UuidValue senderId,
    required _i1.UuidValue recipientId,
    required String text,
    String? mediaUrl,
    String? mediaType,
    int? replyToMessageId,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    DateTime? hiddenForSender,
    DateTime? hiddenForRecipient,
  }) : super._(
         id: id,
         senderId: senderId,
         recipientId: recipientId,
         text: text,
         mediaUrl: mediaUrl,
         mediaType: mediaType,
         replyToMessageId: replyToMessageId,
         createdAt: createdAt,
         deliveredAt: deliveredAt,
         readAt: readAt,
         editedAt: editedAt,
         deletedAt: deletedAt,
         hiddenForSender: hiddenForSender,
         hiddenForRecipient: hiddenForRecipient,
       );

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatMessage copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? senderId,
    _i1.UuidValue? recipientId,
    String? text,
    Object? mediaUrl = _Undefined,
    Object? mediaType = _Undefined,
    Object? replyToMessageId = _Undefined,
    DateTime? createdAt,
    Object? deliveredAt = _Undefined,
    Object? readAt = _Undefined,
    Object? editedAt = _Undefined,
    Object? deletedAt = _Undefined,
    Object? hiddenForSender = _Undefined,
    Object? hiddenForRecipient = _Undefined,
  }) {
    return ChatMessage(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      text: text ?? this.text,
      mediaUrl: mediaUrl is String? ? mediaUrl : this.mediaUrl,
      mediaType: mediaType is String? ? mediaType : this.mediaType,
      replyToMessageId: replyToMessageId is int?
          ? replyToMessageId
          : this.replyToMessageId,
      createdAt: createdAt ?? this.createdAt,
      deliveredAt: deliveredAt is DateTime? ? deliveredAt : this.deliveredAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
      editedAt: editedAt is DateTime? ? editedAt : this.editedAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      hiddenForSender: hiddenForSender is DateTime?
          ? hiddenForSender
          : this.hiddenForSender,
      hiddenForRecipient: hiddenForRecipient is DateTime?
          ? hiddenForRecipient
          : this.hiddenForRecipient,
    );
  }
}

class ChatMessageUpdateTable extends _i1.UpdateTable<ChatMessageTable> {
  ChatMessageUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> senderId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.senderId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> recipientId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.recipientId,
    value,
  );

  _i1.ColumnValue<String, String> text(String value) => _i1.ColumnValue(
    table.text,
    value,
  );

  _i1.ColumnValue<String, String> mediaUrl(String? value) => _i1.ColumnValue(
    table.mediaUrl,
    value,
  );

  _i1.ColumnValue<String, String> mediaType(String? value) => _i1.ColumnValue(
    table.mediaType,
    value,
  );

  _i1.ColumnValue<int, int> replyToMessageId(int? value) => _i1.ColumnValue(
    table.replyToMessageId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> deliveredAt(DateTime? value) =>
      _i1.ColumnValue(
        table.deliveredAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> readAt(DateTime? value) =>
      _i1.ColumnValue(
        table.readAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> editedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.editedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> deletedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.deletedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> hiddenForSender(DateTime? value) =>
      _i1.ColumnValue(
        table.hiddenForSender,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> hiddenForRecipient(DateTime? value) =>
      _i1.ColumnValue(
        table.hiddenForRecipient,
        value,
      );
}

class ChatMessageTable extends _i1.Table<int?> {
  ChatMessageTable({super.tableRelation}) : super(tableName: 'chat_message') {
    updateTable = ChatMessageUpdateTable(this);
    senderId = _i1.ColumnUuid(
      'senderId',
      this,
    );
    recipientId = _i1.ColumnUuid(
      'recipientId',
      this,
    );
    text = _i1.ColumnString(
      'text',
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
    replyToMessageId = _i1.ColumnInt(
      'replyToMessageId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    deliveredAt = _i1.ColumnDateTime(
      'deliveredAt',
      this,
    );
    readAt = _i1.ColumnDateTime(
      'readAt',
      this,
    );
    editedAt = _i1.ColumnDateTime(
      'editedAt',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
    hiddenForSender = _i1.ColumnDateTime(
      'hiddenForSender',
      this,
    );
    hiddenForRecipient = _i1.ColumnDateTime(
      'hiddenForRecipient',
      this,
    );
  }

  late final ChatMessageUpdateTable updateTable;

  /// The auth user id of whoever sent this message.
  late final _i1.ColumnUuid senderId;

  /// The auth user id of whoever should receive this message.
  late final _i1.ColumnUuid recipientId;

  late final _i1.ColumnString text;

  /// Set when this message carries a photo/video/voice note/document
  /// instead of (or alongside) text.
  late final _i1.ColumnString mediaUrl;

  late final _i1.ColumnString mediaType;

  /// The message this one is replying to, if any.
  late final _i1.ColumnInt replyToMessageId;

  late final _i1.ColumnDateTime createdAt;

  /// Set the first time the recipient's client fetches this message.
  late final _i1.ColumnDateTime deliveredAt;

  /// Set once the recipient has opened the conversation.
  late final _i1.ColumnDateTime readAt;

  /// Set when the sender edits the text after sending.
  late final _i1.ColumnDateTime editedAt;

  /// Set when the sender deletes this message for everyone. Text/media
  /// are cleared; the client renders a "message deleted" placeholder.
  late final _i1.ColumnDateTime deletedAt;

  /// Set when the sender/recipient deletes this message for themselves
  /// only — the other party still sees it normally.
  late final _i1.ColumnDateTime hiddenForSender;

  late final _i1.ColumnDateTime hiddenForRecipient;

  @override
  List<_i1.Column> get columns => [
    id,
    senderId,
    recipientId,
    text,
    mediaUrl,
    mediaType,
    replyToMessageId,
    createdAt,
    deliveredAt,
    readAt,
    editedAt,
    deletedAt,
    hiddenForSender,
    hiddenForRecipient,
  ];
}

class ChatMessageInclude extends _i1.IncludeObject {
  ChatMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ChatMessage.t;
}

class ChatMessageIncludeList extends _i1.IncludeList {
  ChatMessageIncludeList._({
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ChatMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ChatMessage.t;
}

class ChatMessageRepository {
  const ChatMessageRepository._();

  /// Returns a list of [ChatMessage]s matching the given query parameters.
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
  Future<List<ChatMessage>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatMessageTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ChatMessage>(
      where: where?.call(ChatMessage.t),
      orderBy: orderBy?.call(ChatMessage.t),
      orderByList: orderByList?.call(ChatMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ChatMessage] matching the given query parameters.
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
  Future<ChatMessage?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatMessageTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ChatMessage>(
      where: where?.call(ChatMessage.t),
      orderBy: orderBy?.call(ChatMessage.t),
      orderByList: orderByList?.call(ChatMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ChatMessage] by its [id] or null if no such row exists.
  Future<ChatMessage?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ChatMessage>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ChatMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [ChatMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<ChatMessage>> insert(
    _i1.DatabaseSession session,
    List<ChatMessage> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<ChatMessage>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [ChatMessage] and returns the inserted row.
  ///
  /// The returned [ChatMessage] will have its `id` field set.
  Future<ChatMessage> insertRow(
    _i1.DatabaseSession session,
    ChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ChatMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ChatMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ChatMessage>> update(
    _i1.DatabaseSession session,
    List<ChatMessage> rows, {
    _i1.ColumnSelections<ChatMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ChatMessage>(
      rows,
      columns: columns?.call(ChatMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ChatMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ChatMessage> updateRow(
    _i1.DatabaseSession session,
    ChatMessage row, {
    _i1.ColumnSelections<ChatMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ChatMessage>(
      row,
      columns: columns?.call(ChatMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ChatMessage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ChatMessage?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ChatMessageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ChatMessage>(
      id,
      columnValues: columnValues(ChatMessage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ChatMessage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ChatMessage>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ChatMessageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ChatMessageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChatMessageTable>? orderBy,
    _i1.OrderByListBuilder<ChatMessageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ChatMessage>(
      columnValues: columnValues(ChatMessage.t.updateTable),
      where: where(ChatMessage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChatMessage.t),
      orderByList: orderByList?.call(ChatMessage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ChatMessage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ChatMessage>> delete(
    _i1.DatabaseSession session,
    List<ChatMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ChatMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ChatMessage].
  Future<ChatMessage> deleteRow(
    _i1.DatabaseSession session,
    ChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ChatMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ChatMessage>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ChatMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ChatMessage>(
      where: where(ChatMessage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ChatMessage>(
      where: where?.call(ChatMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ChatMessage] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ChatMessageTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ChatMessage>(
      where: where(ChatMessage.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
