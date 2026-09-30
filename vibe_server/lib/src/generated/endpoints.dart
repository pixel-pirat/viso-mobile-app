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
import '../auth/email_idp_endpoint.dart' as _i2;
import '../auth/jwt_refresh_endpoint.dart' as _i3;
import '../auth/user_profile_endpoint.dart' as _i4;
import '../chat/chat_endpoint.dart' as _i5;
import '../greetings/greeting_endpoint.dart' as _i6;
import '../media/media_endpoint.dart' as _i7;
import '../notifications/notifications_endpoint.dart' as _i8;
import '../posts/post_endpoint.dart' as _i9;
import '../presence/presence_endpoint.dart' as _i10;
import '../push/push_endpoint.dart' as _i11;
import 'dart:typed_data' as _i12;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i13;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i14;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i3.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'userProfile': _i4.UserProfileEndpoint()
        ..initialize(
          server,
          'userProfile',
          null,
        ),
      'chat': _i5.ChatEndpoint()
        ..initialize(
          server,
          'chat',
          null,
        ),
      'greeting': _i6.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'media': _i7.MediaEndpoint()
        ..initialize(
          server,
          'media',
          null,
        ),
      'notifications': _i8.NotificationsEndpoint()
        ..initialize(
          server,
          'notifications',
          null,
        ),
      'post': _i9.PostEndpoint()
        ..initialize(
          server,
          'post',
          null,
        ),
      'presence': _i10.PresenceEndpoint()
        ..initialize(
          server,
          'presence',
          null,
        ),
      'push': _i11.PushEndpoint()
        ..initialize(
          server,
          'push',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i3.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['userProfile'] = _i1.EndpointConnector(
      name: 'userProfile',
      endpoint: endpoints['userProfile']!,
      methodConnectors: {
        'removeUserImage': _i1.MethodConnector(
          name: 'removeUserImage',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfile'] as _i4.UserProfileEndpoint)
                  .removeUserImage(session),
        ),
        'setUserImage': _i1.MethodConnector(
          name: 'setUserImage',
          params: {
            'image': _i1.ParameterDescription(
              name: 'image',
              type: _i1.getType<_i12.ByteData>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfile'] as _i4.UserProfileEndpoint)
                  .setUserImage(
                    session,
                    params['image'],
                  ),
        ),
        'changeUserName': _i1.MethodConnector(
          name: 'changeUserName',
          params: {
            'userName': _i1.ParameterDescription(
              name: 'userName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfile'] as _i4.UserProfileEndpoint)
                  .changeUserName(
                    session,
                    params['userName'],
                  ),
        ),
        'changeFullName': _i1.MethodConnector(
          name: 'changeFullName',
          params: {
            'fullName': _i1.ParameterDescription(
              name: 'fullName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfile'] as _i4.UserProfileEndpoint)
                  .changeFullName(
                    session,
                    params['fullName'],
                  ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfile'] as _i4.UserProfileEndpoint)
                  .get(session),
        ),
      },
    );
    connectors['chat'] = _i1.EndpointConnector(
      name: 'chat',
      endpoint: endpoints['chat']!,
      methodConnectors: {
        'searchUsers': _i1.MethodConnector(
          name: 'searchUsers',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['chat'] as _i5.ChatEndpoint).searchUsers(
                session,
                params['query'],
              ),
        ),
        'listConversations': _i1.MethodConnector(
          name: 'listConversations',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['chat'] as _i5.ChatEndpoint)
                  .listConversations(session),
        ),
        'getMessages': _i1.MethodConnector(
          name: 'getMessages',
          params: {
            'partnerId': _i1.ParameterDescription(
              name: 'partnerId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['chat'] as _i5.ChatEndpoint).getMessages(
                session,
                params['partnerId'],
                limit: params['limit'],
              ),
        ),
        'sendMessage': _i1.MethodConnector(
          name: 'sendMessage',
          params: {
            'recipientId': _i1.ParameterDescription(
              name: 'recipientId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'text': _i1.ParameterDescription(
              name: 'text',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['chat'] as _i5.ChatEndpoint).sendMessage(
                session,
                params['recipientId'],
                params['text'],
              ),
        ),
        'markConversationRead': _i1.MethodConnector(
          name: 'markConversationRead',
          params: {
            'partnerId': _i1.ParameterDescription(
              name: 'partnerId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['chat'] as _i5.ChatEndpoint).markConversationRead(
                    session,
                    params['partnerId'],
                  ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i6.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    connectors['media'] = _i1.EndpointConnector(
      name: 'media',
      endpoint: endpoints['media']!,
      methodConnectors: {
        'upload': _i1.MethodConnector(
          name: 'upload',
          params: {
            'bytes': _i1.ParameterDescription(
              name: 'bytes',
              type: _i1.getType<_i12.ByteData>(),
              nullable: false,
            ),
            'fileExtension': _i1.ParameterDescription(
              name: 'fileExtension',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['media'] as _i7.MediaEndpoint).upload(
                session,
                params['bytes'],
                params['fileExtension'],
              ),
        ),
      },
    );
    connectors['notifications'] = _i1.EndpointConnector(
      name: 'notifications',
      endpoint: endpoints['notifications']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notifications'] as _i8.NotificationsEndpoint)
                      .list(session),
        ),
        'markRead': _i1.MethodConnector(
          name: 'markRead',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notifications'] as _i8.NotificationsEndpoint)
                      .markRead(
                        session,
                        params['notificationId'],
                      ),
        ),
        'markAllRead': _i1.MethodConnector(
          name: 'markAllRead',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notifications'] as _i8.NotificationsEndpoint)
                      .markAllRead(session),
        ),
        'sendTestNotification': _i1.MethodConnector(
          name: 'sendTestNotification',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notifications'] as _i8.NotificationsEndpoint)
                      .sendTestNotification(session),
        ),
      },
    );
    connectors['post'] = _i1.EndpointConnector(
      name: 'post',
      endpoint: endpoints['post']!,
      methodConnectors: {
        'createPost': _i1.MethodConnector(
          name: 'createPost',
          params: {
            'text': _i1.ParameterDescription(
              name: 'text',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'mediaUrls': _i1.ParameterDescription(
              name: 'mediaUrls',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'mediaType': _i1.ParameterDescription(
              name: 'mediaType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['post'] as _i9.PostEndpoint).createPost(
                session,
                params['text'],
                params['mediaUrls'],
                params['mediaType'],
              ),
        ),
        'getFeed': _i1.MethodConnector(
          name: 'getFeed',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['post'] as _i9.PostEndpoint).getFeed(
                session,
                limit: params['limit'],
                offset: params['offset'],
              ),
        ),
        'getMyPosts': _i1.MethodConnector(
          name: 'getMyPosts',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['post'] as _i9.PostEndpoint).getMyPosts(session),
        ),
        'toggleLike': _i1.MethodConnector(
          name: 'toggleLike',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['post'] as _i9.PostEndpoint).toggleLike(
                session,
                params['postId'],
              ),
        ),
        'recordView': _i1.MethodConnector(
          name: 'recordView',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['post'] as _i9.PostEndpoint).recordView(
                session,
                params['postId'],
              ),
        ),
      },
    );
    connectors['presence'] = _i1.EndpointConnector(
      name: 'presence',
      endpoint: endpoints['presence']!,
      methodConnectors: {
        'heartbeat': _i1.MethodConnector(
          name: 'heartbeat',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['presence'] as _i10.PresenceEndpoint)
                  .heartbeat(session),
        ),
        'getPresence': _i1.MethodConnector(
          name: 'getPresence',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['presence'] as _i10.PresenceEndpoint).getPresence(
                    session,
                    params['userId'],
                  ),
        ),
      },
    );
    connectors['push'] = _i1.EndpointConnector(
      name: 'push',
      endpoint: endpoints['push']!,
      methodConnectors: {
        'registerDeviceToken': _i1.MethodConnector(
          name: 'registerDeviceToken',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['push'] as _i11.PushEndpoint).registerDeviceToken(
                    session,
                    params['token'],
                    params['platform'],
                  ),
        ),
        'unregisterDeviceToken': _i1.MethodConnector(
          name: 'unregisterDeviceToken',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['push'] as _i11.PushEndpoint)
                  .unregisterDeviceToken(
                    session,
                    params['token'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_core'] = _i13.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_idp'] = _i14.Endpoints()
      ..initializeEndpoints(server);
  }
}
