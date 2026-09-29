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

/// One row in the signed-in user's conversation list: the other
/// participant plus a preview of the most recent message.
abstract class ChatConversationSummary
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ChatConversationSummary._({
    required this.partnerId,
    required this.partnerName,
    this.partnerUserName,
    this.partnerAvatarUrl,
    required this.lastMessageText,
    required this.lastMessageAt,
    required this.lastMessageIsMine,
    required this.unreadCount,
    required this.partnerIsOnline,
  });

  factory ChatConversationSummary({
    required _i1.UuidValue partnerId,
    required String partnerName,
    String? partnerUserName,
    String? partnerAvatarUrl,
    required String lastMessageText,
    required DateTime lastMessageAt,
    required bool lastMessageIsMine,
    required int unreadCount,
    required bool partnerIsOnline,
  }) = _ChatConversationSummaryImpl;

  factory ChatConversationSummary.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ChatConversationSummary(
      partnerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['partnerId'],
      ),
      partnerName: jsonSerialization['partnerName'] as String,
      partnerUserName: jsonSerialization['partnerUserName'] as String?,
      partnerAvatarUrl: jsonSerialization['partnerAvatarUrl'] as String?,
      lastMessageText: jsonSerialization['lastMessageText'] as String,
      lastMessageAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastMessageAt'],
      ),
      lastMessageIsMine: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['lastMessageIsMine'],
      ),
      unreadCount: jsonSerialization['unreadCount'] as int,
      partnerIsOnline: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['partnerIsOnline'],
      ),
    );
  }

  _i1.UuidValue partnerId;

  String partnerName;

  String? partnerUserName;

  String? partnerAvatarUrl;

  String lastMessageText;

  DateTime lastMessageAt;

  bool lastMessageIsMine;

  int unreadCount;

  bool partnerIsOnline;

  /// Returns a shallow copy of this [ChatConversationSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatConversationSummary copyWith({
    _i1.UuidValue? partnerId,
    String? partnerName,
    String? partnerUserName,
    String? partnerAvatarUrl,
    String? lastMessageText,
    DateTime? lastMessageAt,
    bool? lastMessageIsMine,
    int? unreadCount,
    bool? partnerIsOnline,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChatConversationSummary',
      'partnerId': partnerId.toJson(),
      'partnerName': partnerName,
      if (partnerUserName != null) 'partnerUserName': partnerUserName,
      if (partnerAvatarUrl != null) 'partnerAvatarUrl': partnerAvatarUrl,
      'lastMessageText': lastMessageText,
      'lastMessageAt': lastMessageAt.toJson(),
      'lastMessageIsMine': lastMessageIsMine,
      'unreadCount': unreadCount,
      'partnerIsOnline': partnerIsOnline,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ChatConversationSummary',
      'partnerId': partnerId.toJson(),
      'partnerName': partnerName,
      if (partnerUserName != null) 'partnerUserName': partnerUserName,
      if (partnerAvatarUrl != null) 'partnerAvatarUrl': partnerAvatarUrl,
      'lastMessageText': lastMessageText,
      'lastMessageAt': lastMessageAt.toJson(),
      'lastMessageIsMine': lastMessageIsMine,
      'unreadCount': unreadCount,
      'partnerIsOnline': partnerIsOnline,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatConversationSummaryImpl extends ChatConversationSummary {
  _ChatConversationSummaryImpl({
    required _i1.UuidValue partnerId,
    required String partnerName,
    String? partnerUserName,
    String? partnerAvatarUrl,
    required String lastMessageText,
    required DateTime lastMessageAt,
    required bool lastMessageIsMine,
    required int unreadCount,
    required bool partnerIsOnline,
  }) : super._(
         partnerId: partnerId,
         partnerName: partnerName,
         partnerUserName: partnerUserName,
         partnerAvatarUrl: partnerAvatarUrl,
         lastMessageText: lastMessageText,
         lastMessageAt: lastMessageAt,
         lastMessageIsMine: lastMessageIsMine,
         unreadCount: unreadCount,
         partnerIsOnline: partnerIsOnline,
       );

  /// Returns a shallow copy of this [ChatConversationSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatConversationSummary copyWith({
    _i1.UuidValue? partnerId,
    String? partnerName,
    Object? partnerUserName = _Undefined,
    Object? partnerAvatarUrl = _Undefined,
    String? lastMessageText,
    DateTime? lastMessageAt,
    bool? lastMessageIsMine,
    int? unreadCount,
    bool? partnerIsOnline,
  }) {
    return ChatConversationSummary(
      partnerId: partnerId ?? this.partnerId,
      partnerName: partnerName ?? this.partnerName,
      partnerUserName: partnerUserName is String?
          ? partnerUserName
          : this.partnerUserName,
      partnerAvatarUrl: partnerAvatarUrl is String?
          ? partnerAvatarUrl
          : this.partnerAvatarUrl,
      lastMessageText: lastMessageText ?? this.lastMessageText,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      lastMessageIsMine: lastMessageIsMine ?? this.lastMessageIsMine,
      unreadCount: unreadCount ?? this.unreadCount,
      partnerIsOnline: partnerIsOnline ?? this.partnerIsOnline,
    );
  }
}
