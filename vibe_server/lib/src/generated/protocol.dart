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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i3;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i4;
import 'chat/models/archived_conversation.dart' as _i5;
import 'chat/models/blocked_user.dart' as _i6;
import 'chat/models/chat_conversation_summary.dart' as _i7;
import 'chat/models/chat_message.dart' as _i8;
import 'chat/models/chat_message_view.dart' as _i9;
import 'chat/models/message_reaction.dart' as _i10;
import 'chat/models/message_reaction_info.dart' as _i11;
import 'chat/models/muted_conversation.dart' as _i12;
import 'chat/models/pinned_conversation.dart' as _i13;
import 'chat/models/starred_message.dart' as _i14;
import 'chat/models/typing_status.dart' as _i15;
import 'greetings/greeting.dart' as _i16;
import 'notifications/models/app_notification.dart' as _i17;
import 'posts/models/post.dart' as _i18;
import 'posts/models/post_feed_item.dart' as _i19;
import 'posts/models/post_like.dart' as _i20;
import 'presence/models/presence_status.dart' as _i21;
import 'presence/models/user_presence.dart' as _i22;
import 'push/models/device_token.dart' as _i23;
import 'stories/models/story.dart' as _i24;
import 'stories/models/story_group.dart' as _i25;
import 'stories/models/story_item.dart' as _i26;
import 'stories/models/story_view.dart' as _i27;
import 'package:vibe_server/src/generated/chat/models/chat_conversation_summary.dart'
    as _i28;
import 'package:vibe_server/src/generated/chat/models/chat_message_view.dart'
    as _i29;
import 'package:vibe_server/src/generated/notifications/models/app_notification.dart'
    as _i30;
import 'package:vibe_server/src/generated/posts/models/post_feed_item.dart'
    as _i31;
import 'package:vibe_server/src/generated/stories/models/story_group.dart'
    as _i32;
export 'chat/models/archived_conversation.dart';
export 'chat/models/blocked_user.dart';
export 'chat/models/chat_conversation_summary.dart';
export 'chat/models/chat_message.dart';
export 'chat/models/chat_message_view.dart';
export 'chat/models/message_reaction.dart';
export 'chat/models/message_reaction_info.dart';
export 'chat/models/muted_conversation.dart';
export 'chat/models/pinned_conversation.dart';
export 'chat/models/starred_message.dart';
export 'chat/models/typing_status.dart';
export 'greetings/greeting.dart';
export 'notifications/models/app_notification.dart';
export 'posts/models/post.dart';
export 'posts/models/post_feed_item.dart';
export 'posts/models/post_like.dart';
export 'presence/models/presence_status.dart';
export 'presence/models/user_presence.dart';
export 'push/models/device_token.dart';
export 'stories/models/story.dart';
export 'stories/models/story_group.dart';
export 'stories/models/story_item.dart';
export 'stories/models/story_view.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'app_notification',
      dartName: 'AppNotification',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'app_notification_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'recipientId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'body',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'relatedUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'relatedUserName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'relatedUserAvatarUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'readAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'app_notification_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'app_notification_recipient_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'recipientId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'archived_conversation',
      dartName: 'ArchivedConversation',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'archived_conversation_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'archivedUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'archived_conversation_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'archived_conversation_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'archivedUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'blocked_user',
      dartName: 'BlockedUser',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'blocked_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'blockerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'blockedId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'blocked_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'blocked_user_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'blockerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'blockedId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'chat_message',
      dartName: 'ChatMessage',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'chat_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'senderId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'recipientId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mediaUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'mediaType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'replyToMessageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'linkPreviewUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'linkPreviewTitle',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'linkPreviewDescription',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'linkPreviewImageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'deliveredAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'readAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'editedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'hiddenForSender',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'hiddenForRecipient',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'chat_message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'chat_message_sender_recipient_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'senderId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'recipientId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'chat_message_recipient_sender_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'recipientId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'senderId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'device_token',
      dartName: 'DeviceToken',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'device_token_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'token',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'device_token_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'device_token_token_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'token',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'device_token_auth_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'message_reaction',
      dartName: 'MessageReaction',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'message_reaction_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'messageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'emoji',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'message_reaction_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'message_reaction_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'messageId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'muted_conversation',
      dartName: 'MutedConversation',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'muted_conversation_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'mutedUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'muted_conversation_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'muted_conversation_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'mutedUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'pinned_conversation',
      dartName: 'PinnedConversation',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'pinned_conversation_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'pinnedUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'pinned_conversation_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'pinned_conversation_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'pinnedUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'post',
      dartName: 'Post',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authorId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mediaUrls',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'mediaType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'likeCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'commentCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'viewCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'post_created_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'post_author_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authorId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'post_like',
      dartName: 'PostLike',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_like_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_like_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'post_like_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'postId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'starred_message',
      dartName: 'StarredMessage',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'starred_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'messageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'starred_message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'starred_message_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'messageId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'story',
      dartName: 'Story',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'story_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authorId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'mediaUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mediaType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'viewCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'story_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'story_author_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authorId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'story_expires_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'expiresAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'story_view',
      dartName: 'StoryView',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'story_view_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'storyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'viewerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'viewedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'story_view_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'story_view_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storyId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'viewerId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_presence',
      dartName: 'UserPresence',
      schema: 'public',
      module: 'vibe',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_presence_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'lastActiveAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_presence_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_presence_auth_user_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.ArchivedConversation) {
      return _i5.ArchivedConversation.fromJson(data) as T;
    }
    if (t == _i6.BlockedUser) {
      return _i6.BlockedUser.fromJson(data) as T;
    }
    if (t == _i7.ChatConversationSummary) {
      return _i7.ChatConversationSummary.fromJson(data) as T;
    }
    if (t == _i8.ChatMessage) {
      return _i8.ChatMessage.fromJson(data) as T;
    }
    if (t == _i9.ChatMessageView) {
      return _i9.ChatMessageView.fromJson(data) as T;
    }
    if (t == _i10.MessageReaction) {
      return _i10.MessageReaction.fromJson(data) as T;
    }
    if (t == _i11.MessageReactionInfo) {
      return _i11.MessageReactionInfo.fromJson(data) as T;
    }
    if (t == _i12.MutedConversation) {
      return _i12.MutedConversation.fromJson(data) as T;
    }
    if (t == _i13.PinnedConversation) {
      return _i13.PinnedConversation.fromJson(data) as T;
    }
    if (t == _i14.StarredMessage) {
      return _i14.StarredMessage.fromJson(data) as T;
    }
    if (t == _i15.TypingStatus) {
      return _i15.TypingStatus.fromJson(data) as T;
    }
    if (t == _i16.Greeting) {
      return _i16.Greeting.fromJson(data) as T;
    }
    if (t == _i17.AppNotification) {
      return _i17.AppNotification.fromJson(data) as T;
    }
    if (t == _i18.Post) {
      return _i18.Post.fromJson(data) as T;
    }
    if (t == _i19.PostFeedItem) {
      return _i19.PostFeedItem.fromJson(data) as T;
    }
    if (t == _i20.PostLike) {
      return _i20.PostLike.fromJson(data) as T;
    }
    if (t == _i21.PresenceStatus) {
      return _i21.PresenceStatus.fromJson(data) as T;
    }
    if (t == _i22.UserPresence) {
      return _i22.UserPresence.fromJson(data) as T;
    }
    if (t == _i23.DeviceToken) {
      return _i23.DeviceToken.fromJson(data) as T;
    }
    if (t == _i24.Story) {
      return _i24.Story.fromJson(data) as T;
    }
    if (t == _i25.StoryGroup) {
      return _i25.StoryGroup.fromJson(data) as T;
    }
    if (t == _i26.StoryItem) {
      return _i26.StoryItem.fromJson(data) as T;
    }
    if (t == _i27.StoryView) {
      return _i27.StoryView.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.ArchivedConversation?>()) {
      return (data != null ? _i5.ArchivedConversation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.BlockedUser?>()) {
      return (data != null ? _i6.BlockedUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ChatConversationSummary?>()) {
      return (data != null ? _i7.ChatConversationSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.ChatMessage?>()) {
      return (data != null ? _i8.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ChatMessageView?>()) {
      return (data != null ? _i9.ChatMessageView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.MessageReaction?>()) {
      return (data != null ? _i10.MessageReaction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.MessageReactionInfo?>()) {
      return (data != null ? _i11.MessageReactionInfo.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.MutedConversation?>()) {
      return (data != null ? _i12.MutedConversation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PinnedConversation?>()) {
      return (data != null ? _i13.PinnedConversation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.StarredMessage?>()) {
      return (data != null ? _i14.StarredMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.TypingStatus?>()) {
      return (data != null ? _i15.TypingStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Greeting?>()) {
      return (data != null ? _i16.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.AppNotification?>()) {
      return (data != null ? _i17.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Post?>()) {
      return (data != null ? _i18.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PostFeedItem?>()) {
      return (data != null ? _i19.PostFeedItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PostLike?>()) {
      return (data != null ? _i20.PostLike.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PresenceStatus?>()) {
      return (data != null ? _i21.PresenceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.UserPresence?>()) {
      return (data != null ? _i22.UserPresence.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.DeviceToken?>()) {
      return (data != null ? _i23.DeviceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Story?>()) {
      return (data != null ? _i24.Story.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.StoryGroup?>()) {
      return (data != null ? _i25.StoryGroup.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.StoryItem?>()) {
      return (data != null ? _i26.StoryItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.StoryView?>()) {
      return (data != null ? _i27.StoryView.fromJson(data) : null) as T;
    }
    if (t == List<_i11.MessageReactionInfo>) {
      return (data as List)
              .map((e) => deserialize<_i11.MessageReactionInfo>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i26.StoryItem>) {
      return (data as List).map((e) => deserialize<_i26.StoryItem>(e)).toList()
          as T;
    }
    if (t == List<_i3.UserProfileModel>) {
      return (data as List)
              .map((e) => deserialize<_i3.UserProfileModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.ChatConversationSummary>) {
      return (data as List)
              .map((e) => deserialize<_i28.ChatConversationSummary>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i29.ChatMessageView>) {
      return (data as List)
              .map((e) => deserialize<_i29.ChatMessageView>(e))
              .toList()
          as T;
    }
    if (t == List<_i30.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_i30.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i31.PostFeedItem>) {
      return (data as List)
              .map((e) => deserialize<_i31.PostFeedItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i32.StoryGroup>) {
      return (data as List).map((e) => deserialize<_i32.StoryGroup>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.ArchivedConversation => 'ArchivedConversation',
      _i6.BlockedUser => 'BlockedUser',
      _i7.ChatConversationSummary => 'ChatConversationSummary',
      _i8.ChatMessage => 'ChatMessage',
      _i9.ChatMessageView => 'ChatMessageView',
      _i10.MessageReaction => 'MessageReaction',
      _i11.MessageReactionInfo => 'MessageReactionInfo',
      _i12.MutedConversation => 'MutedConversation',
      _i13.PinnedConversation => 'PinnedConversation',
      _i14.StarredMessage => 'StarredMessage',
      _i15.TypingStatus => 'TypingStatus',
      _i16.Greeting => 'Greeting',
      _i17.AppNotification => 'AppNotification',
      _i18.Post => 'Post',
      _i19.PostFeedItem => 'PostFeedItem',
      _i20.PostLike => 'PostLike',
      _i21.PresenceStatus => 'PresenceStatus',
      _i22.UserPresence => 'UserPresence',
      _i23.DeviceToken => 'DeviceToken',
      _i24.Story => 'Story',
      _i25.StoryGroup => 'StoryGroup',
      _i26.StoryItem => 'StoryItem',
      _i27.StoryView => 'StoryView',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('vibe.', '');
    }

    switch (data) {
      case _i5.ArchivedConversation():
        return 'ArchivedConversation';
      case _i6.BlockedUser():
        return 'BlockedUser';
      case _i7.ChatConversationSummary():
        return 'ChatConversationSummary';
      case _i8.ChatMessage():
        return 'ChatMessage';
      case _i9.ChatMessageView():
        return 'ChatMessageView';
      case _i10.MessageReaction():
        return 'MessageReaction';
      case _i11.MessageReactionInfo():
        return 'MessageReactionInfo';
      case _i12.MutedConversation():
        return 'MutedConversation';
      case _i13.PinnedConversation():
        return 'PinnedConversation';
      case _i14.StarredMessage():
        return 'StarredMessage';
      case _i15.TypingStatus():
        return 'TypingStatus';
      case _i16.Greeting():
        return 'Greeting';
      case _i17.AppNotification():
        return 'AppNotification';
      case _i18.Post():
        return 'Post';
      case _i19.PostFeedItem():
        return 'PostFeedItem';
      case _i20.PostLike():
        return 'PostLike';
      case _i21.PresenceStatus():
        return 'PresenceStatus';
      case _i22.UserPresence():
        return 'UserPresence';
      case _i23.DeviceToken():
        return 'DeviceToken';
      case _i24.Story():
        return 'Story';
      case _i25.StoryGroup():
        return 'StoryGroup';
      case _i26.StoryItem():
        return 'StoryItem';
      case _i27.StoryView():
        return 'StoryView';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ArchivedConversation') {
      return deserialize<_i5.ArchivedConversation>(data['data']);
    }
    if (dataClassName == 'BlockedUser') {
      return deserialize<_i6.BlockedUser>(data['data']);
    }
    if (dataClassName == 'ChatConversationSummary') {
      return deserialize<_i7.ChatConversationSummary>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i8.ChatMessage>(data['data']);
    }
    if (dataClassName == 'ChatMessageView') {
      return deserialize<_i9.ChatMessageView>(data['data']);
    }
    if (dataClassName == 'MessageReaction') {
      return deserialize<_i10.MessageReaction>(data['data']);
    }
    if (dataClassName == 'MessageReactionInfo') {
      return deserialize<_i11.MessageReactionInfo>(data['data']);
    }
    if (dataClassName == 'MutedConversation') {
      return deserialize<_i12.MutedConversation>(data['data']);
    }
    if (dataClassName == 'PinnedConversation') {
      return deserialize<_i13.PinnedConversation>(data['data']);
    }
    if (dataClassName == 'StarredMessage') {
      return deserialize<_i14.StarredMessage>(data['data']);
    }
    if (dataClassName == 'TypingStatus') {
      return deserialize<_i15.TypingStatus>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i16.Greeting>(data['data']);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_i17.AppNotification>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i18.Post>(data['data']);
    }
    if (dataClassName == 'PostFeedItem') {
      return deserialize<_i19.PostFeedItem>(data['data']);
    }
    if (dataClassName == 'PostLike') {
      return deserialize<_i20.PostLike>(data['data']);
    }
    if (dataClassName == 'PresenceStatus') {
      return deserialize<_i21.PresenceStatus>(data['data']);
    }
    if (dataClassName == 'UserPresence') {
      return deserialize<_i22.UserPresence>(data['data']);
    }
    if (dataClassName == 'DeviceToken') {
      return deserialize<_i23.DeviceToken>(data['data']);
    }
    if (dataClassName == 'Story') {
      return deserialize<_i24.Story>(data['data']);
    }
    if (dataClassName == 'StoryGroup') {
      return deserialize<_i25.StoryGroup>(data['data']);
    }
    if (dataClassName == 'StoryItem') {
      return deserialize<_i26.StoryItem>(data['data']);
    }
    if (dataClassName == 'StoryView') {
      return deserialize<_i27.StoryView>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.ArchivedConversation:
        return _i5.ArchivedConversation.t;
      case _i6.BlockedUser:
        return _i6.BlockedUser.t;
      case _i8.ChatMessage:
        return _i8.ChatMessage.t;
      case _i10.MessageReaction:
        return _i10.MessageReaction.t;
      case _i12.MutedConversation:
        return _i12.MutedConversation.t;
      case _i13.PinnedConversation:
        return _i13.PinnedConversation.t;
      case _i14.StarredMessage:
        return _i14.StarredMessage.t;
      case _i17.AppNotification:
        return _i17.AppNotification.t;
      case _i18.Post:
        return _i18.Post.t;
      case _i20.PostLike:
        return _i20.PostLike.t;
      case _i22.UserPresence:
        return _i22.UserPresence.t;
      case _i23.DeviceToken:
        return _i23.DeviceToken.t;
      case _i24.Story:
        return _i24.Story.t;
      case _i27.StoryView:
        return _i27.StoryView.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'vibe';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
