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
import 'chat/models/chat_conversation_summary.dart' as _i5;
import 'chat/models/chat_message.dart' as _i6;
import 'chat/models/chat_message_view.dart' as _i7;
import 'chat/models/message_reaction.dart' as _i8;
import 'chat/models/message_reaction_info.dart' as _i9;
import 'chat/models/typing_status.dart' as _i10;
import 'greetings/greeting.dart' as _i11;
import 'notifications/models/app_notification.dart' as _i12;
import 'posts/models/post.dart' as _i13;
import 'posts/models/post_feed_item.dart' as _i14;
import 'posts/models/post_like.dart' as _i15;
import 'presence/models/presence_status.dart' as _i16;
import 'presence/models/user_presence.dart' as _i17;
import 'push/models/device_token.dart' as _i18;
import 'stories/models/story.dart' as _i19;
import 'stories/models/story_group.dart' as _i20;
import 'stories/models/story_item.dart' as _i21;
import 'stories/models/story_view.dart' as _i22;
import 'package:vibe_server/src/generated/chat/models/chat_conversation_summary.dart'
    as _i23;
import 'package:vibe_server/src/generated/chat/models/chat_message_view.dart'
    as _i24;
import 'package:vibe_server/src/generated/notifications/models/app_notification.dart'
    as _i25;
import 'package:vibe_server/src/generated/posts/models/post_feed_item.dart'
    as _i26;
import 'package:vibe_server/src/generated/stories/models/story_group.dart'
    as _i27;
export 'chat/models/chat_conversation_summary.dart';
export 'chat/models/chat_message.dart';
export 'chat/models/chat_message_view.dart';
export 'chat/models/message_reaction.dart';
export 'chat/models/message_reaction_info.dart';
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

    if (t == _i5.ChatConversationSummary) {
      return _i5.ChatConversationSummary.fromJson(data) as T;
    }
    if (t == _i6.ChatMessage) {
      return _i6.ChatMessage.fromJson(data) as T;
    }
    if (t == _i7.ChatMessageView) {
      return _i7.ChatMessageView.fromJson(data) as T;
    }
    if (t == _i8.MessageReaction) {
      return _i8.MessageReaction.fromJson(data) as T;
    }
    if (t == _i9.MessageReactionInfo) {
      return _i9.MessageReactionInfo.fromJson(data) as T;
    }
    if (t == _i10.TypingStatus) {
      return _i10.TypingStatus.fromJson(data) as T;
    }
    if (t == _i11.Greeting) {
      return _i11.Greeting.fromJson(data) as T;
    }
    if (t == _i12.AppNotification) {
      return _i12.AppNotification.fromJson(data) as T;
    }
    if (t == _i13.Post) {
      return _i13.Post.fromJson(data) as T;
    }
    if (t == _i14.PostFeedItem) {
      return _i14.PostFeedItem.fromJson(data) as T;
    }
    if (t == _i15.PostLike) {
      return _i15.PostLike.fromJson(data) as T;
    }
    if (t == _i16.PresenceStatus) {
      return _i16.PresenceStatus.fromJson(data) as T;
    }
    if (t == _i17.UserPresence) {
      return _i17.UserPresence.fromJson(data) as T;
    }
    if (t == _i18.DeviceToken) {
      return _i18.DeviceToken.fromJson(data) as T;
    }
    if (t == _i19.Story) {
      return _i19.Story.fromJson(data) as T;
    }
    if (t == _i20.StoryGroup) {
      return _i20.StoryGroup.fromJson(data) as T;
    }
    if (t == _i21.StoryItem) {
      return _i21.StoryItem.fromJson(data) as T;
    }
    if (t == _i22.StoryView) {
      return _i22.StoryView.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.ChatConversationSummary?>()) {
      return (data != null ? _i5.ChatConversationSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.ChatMessage?>()) {
      return (data != null ? _i6.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ChatMessageView?>()) {
      return (data != null ? _i7.ChatMessageView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.MessageReaction?>()) {
      return (data != null ? _i8.MessageReaction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.MessageReactionInfo?>()) {
      return (data != null ? _i9.MessageReactionInfo.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.TypingStatus?>()) {
      return (data != null ? _i10.TypingStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Greeting?>()) {
      return (data != null ? _i11.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.AppNotification?>()) {
      return (data != null ? _i12.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Post?>()) {
      return (data != null ? _i13.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PostFeedItem?>()) {
      return (data != null ? _i14.PostFeedItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PostLike?>()) {
      return (data != null ? _i15.PostLike.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PresenceStatus?>()) {
      return (data != null ? _i16.PresenceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.UserPresence?>()) {
      return (data != null ? _i17.UserPresence.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.DeviceToken?>()) {
      return (data != null ? _i18.DeviceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Story?>()) {
      return (data != null ? _i19.Story.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.StoryGroup?>()) {
      return (data != null ? _i20.StoryGroup.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.StoryItem?>()) {
      return (data != null ? _i21.StoryItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.StoryView?>()) {
      return (data != null ? _i22.StoryView.fromJson(data) : null) as T;
    }
    if (t == List<_i9.MessageReactionInfo>) {
      return (data as List)
              .map((e) => deserialize<_i9.MessageReactionInfo>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i21.StoryItem>) {
      return (data as List).map((e) => deserialize<_i21.StoryItem>(e)).toList()
          as T;
    }
    if (t == List<_i3.UserProfileModel>) {
      return (data as List)
              .map((e) => deserialize<_i3.UserProfileModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i23.ChatConversationSummary>) {
      return (data as List)
              .map((e) => deserialize<_i23.ChatConversationSummary>(e))
              .toList()
          as T;
    }
    if (t == List<_i24.ChatMessageView>) {
      return (data as List)
              .map((e) => deserialize<_i24.ChatMessageView>(e))
              .toList()
          as T;
    }
    if (t == List<_i25.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_i25.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i26.PostFeedItem>) {
      return (data as List)
              .map((e) => deserialize<_i26.PostFeedItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i27.StoryGroup>) {
      return (data as List).map((e) => deserialize<_i27.StoryGroup>(e)).toList()
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
      _i5.ChatConversationSummary => 'ChatConversationSummary',
      _i6.ChatMessage => 'ChatMessage',
      _i7.ChatMessageView => 'ChatMessageView',
      _i8.MessageReaction => 'MessageReaction',
      _i9.MessageReactionInfo => 'MessageReactionInfo',
      _i10.TypingStatus => 'TypingStatus',
      _i11.Greeting => 'Greeting',
      _i12.AppNotification => 'AppNotification',
      _i13.Post => 'Post',
      _i14.PostFeedItem => 'PostFeedItem',
      _i15.PostLike => 'PostLike',
      _i16.PresenceStatus => 'PresenceStatus',
      _i17.UserPresence => 'UserPresence',
      _i18.DeviceToken => 'DeviceToken',
      _i19.Story => 'Story',
      _i20.StoryGroup => 'StoryGroup',
      _i21.StoryItem => 'StoryItem',
      _i22.StoryView => 'StoryView',
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
      case _i5.ChatConversationSummary():
        return 'ChatConversationSummary';
      case _i6.ChatMessage():
        return 'ChatMessage';
      case _i7.ChatMessageView():
        return 'ChatMessageView';
      case _i8.MessageReaction():
        return 'MessageReaction';
      case _i9.MessageReactionInfo():
        return 'MessageReactionInfo';
      case _i10.TypingStatus():
        return 'TypingStatus';
      case _i11.Greeting():
        return 'Greeting';
      case _i12.AppNotification():
        return 'AppNotification';
      case _i13.Post():
        return 'Post';
      case _i14.PostFeedItem():
        return 'PostFeedItem';
      case _i15.PostLike():
        return 'PostLike';
      case _i16.PresenceStatus():
        return 'PresenceStatus';
      case _i17.UserPresence():
        return 'UserPresence';
      case _i18.DeviceToken():
        return 'DeviceToken';
      case _i19.Story():
        return 'Story';
      case _i20.StoryGroup():
        return 'StoryGroup';
      case _i21.StoryItem():
        return 'StoryItem';
      case _i22.StoryView():
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
    if (dataClassName == 'ChatConversationSummary') {
      return deserialize<_i5.ChatConversationSummary>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i6.ChatMessage>(data['data']);
    }
    if (dataClassName == 'ChatMessageView') {
      return deserialize<_i7.ChatMessageView>(data['data']);
    }
    if (dataClassName == 'MessageReaction') {
      return deserialize<_i8.MessageReaction>(data['data']);
    }
    if (dataClassName == 'MessageReactionInfo') {
      return deserialize<_i9.MessageReactionInfo>(data['data']);
    }
    if (dataClassName == 'TypingStatus') {
      return deserialize<_i10.TypingStatus>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i11.Greeting>(data['data']);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_i12.AppNotification>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i13.Post>(data['data']);
    }
    if (dataClassName == 'PostFeedItem') {
      return deserialize<_i14.PostFeedItem>(data['data']);
    }
    if (dataClassName == 'PostLike') {
      return deserialize<_i15.PostLike>(data['data']);
    }
    if (dataClassName == 'PresenceStatus') {
      return deserialize<_i16.PresenceStatus>(data['data']);
    }
    if (dataClassName == 'UserPresence') {
      return deserialize<_i17.UserPresence>(data['data']);
    }
    if (dataClassName == 'DeviceToken') {
      return deserialize<_i18.DeviceToken>(data['data']);
    }
    if (dataClassName == 'Story') {
      return deserialize<_i19.Story>(data['data']);
    }
    if (dataClassName == 'StoryGroup') {
      return deserialize<_i20.StoryGroup>(data['data']);
    }
    if (dataClassName == 'StoryItem') {
      return deserialize<_i21.StoryItem>(data['data']);
    }
    if (dataClassName == 'StoryView') {
      return deserialize<_i22.StoryView>(data['data']);
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
      case _i6.ChatMessage:
        return _i6.ChatMessage.t;
      case _i8.MessageReaction:
        return _i8.MessageReaction.t;
      case _i12.AppNotification:
        return _i12.AppNotification.t;
      case _i13.Post:
        return _i13.Post.t;
      case _i15.PostLike:
        return _i15.PostLike.t;
      case _i17.UserPresence:
        return _i17.UserPresence.t;
      case _i18.DeviceToken:
        return _i18.DeviceToken.t;
      case _i19.Story:
        return _i19.Story.t;
      case _i22.StoryView:
        return _i22.StoryView.t;
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
