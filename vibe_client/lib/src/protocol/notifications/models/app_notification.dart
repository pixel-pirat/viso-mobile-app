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

import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// A real in-app notification for a user, e.g. "so-and-so sent you a
/// message". Read from the Notifications screen.
abstract class AppNotification implements _i1.SerializableModel {
  AppNotification._({
    this.id,
    required this.recipientId,
    required this.type,
    required this.title,
    required this.body,
    this.relatedUserId,
    this.relatedUserName,
    this.relatedUserAvatarUrl,
    DateTime? createdAt,
    this.readAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory AppNotification({
    int? id,
    required _i1.UuidValue recipientId,
    required String type,
    required String title,
    required String body,
    _i1.UuidValue? relatedUserId,
    String? relatedUserName,
    String? relatedUserAvatarUrl,
    DateTime? createdAt,
    DateTime? readAt,
  }) = _AppNotificationImpl;

  factory AppNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppNotification(
      id: jsonSerialization['id'] as int?,
      recipientId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['recipientId'],
      ),
      type: jsonSerialization['type'] as String,
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String,
      relatedUserId: jsonSerialization['relatedUserId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['relatedUserId'],
            ),
      relatedUserName: jsonSerialization['relatedUserName'] as String?,
      relatedUserAvatarUrl:
          jsonSerialization['relatedUserAvatarUrl'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue recipientId;

  /// e.g. 'message'. Lets the client pick an icon/behavior.
  String type;

  String title;

  String body;

  /// The other user this notification is about, if any (e.g. the sender
  /// of a message), so the client can show their avatar and deep-link.
  _i1.UuidValue? relatedUserId;

  String? relatedUserName;

  String? relatedUserAvatarUrl;

  DateTime createdAt;

  DateTime? readAt;

  /// Returns a shallow copy of this [AppNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppNotification copyWith({
    int? id,
    _i1.UuidValue? recipientId,
    String? type,
    String? title,
    String? body,
    _i1.UuidValue? relatedUserId,
    String? relatedUserName,
    String? relatedUserAvatarUrl,
    DateTime? createdAt,
    DateTime? readAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppNotification',
      if (id != null) 'id': id,
      'recipientId': recipientId.toJson(),
      'type': type,
      'title': title,
      'body': body,
      if (relatedUserId != null) 'relatedUserId': relatedUserId?.toJson(),
      if (relatedUserName != null) 'relatedUserName': relatedUserName,
      if (relatedUserAvatarUrl != null)
        'relatedUserAvatarUrl': relatedUserAvatarUrl,
      'createdAt': createdAt.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppNotificationImpl extends AppNotification {
  _AppNotificationImpl({
    int? id,
    required _i1.UuidValue recipientId,
    required String type,
    required String title,
    required String body,
    _i1.UuidValue? relatedUserId,
    String? relatedUserName,
    String? relatedUserAvatarUrl,
    DateTime? createdAt,
    DateTime? readAt,
  }) : super._(
         id: id,
         recipientId: recipientId,
         type: type,
         title: title,
         body: body,
         relatedUserId: relatedUserId,
         relatedUserName: relatedUserName,
         relatedUserAvatarUrl: relatedUserAvatarUrl,
         createdAt: createdAt,
         readAt: readAt,
       );

  /// Returns a shallow copy of this [AppNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppNotification copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? recipientId,
    String? type,
    String? title,
    String? body,
    Object? relatedUserId = _Undefined,
    Object? relatedUserName = _Undefined,
    Object? relatedUserAvatarUrl = _Undefined,
    DateTime? createdAt,
    Object? readAt = _Undefined,
  }) {
    return AppNotification(
      id: id is int? ? id : this.id,
      recipientId: recipientId ?? this.recipientId,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      relatedUserId: relatedUserId is _i1.UuidValue?
          ? relatedUserId
          : this.relatedUserId,
      relatedUserName: relatedUserName is String?
          ? relatedUserName
          : this.relatedUserName,
      relatedUserAvatarUrl: relatedUserAvatarUrl is String?
          ? relatedUserAvatarUrl
          : this.relatedUserAvatarUrl,
      createdAt: createdAt ?? this.createdAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
    );
  }
}
