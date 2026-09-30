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

import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'dart:typed_data' as _i5;
import 'package:vibe_client/src/protocol/chat/models/chat_conversation_summary.dart'
    as _i6;
import 'package:vibe_client/src/protocol/chat/models/chat_message.dart' as _i7;
import 'package:vibe_client/src/protocol/greetings/greeting.dart' as _i8;
import 'package:vibe_client/src/protocol/notifications/models/app_notification.dart'
    as _i9;
import 'package:vibe_client/src/protocol/posts/models/post.dart' as _i10;
import 'package:vibe_client/src/protocol/posts/models/post_feed_item.dart'
    as _i11;
import 'package:vibe_client/src/protocol/presence/models/presence_status.dart'
    as _i12;
import 'package:vibe_client/src/protocol/stories/models/story.dart' as _i13;
import 'package:vibe_client/src/protocol/stories/models/story_group.dart'
    as _i14;
import 'protocol.dart' as _i15;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i1.EndpointEmailIdpBase {
  EndpointEmailIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i3.Future<_i2.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i3.Future<String> verifyRegistrationCode({
    required _i2.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i3.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i3.Future<_i2.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i3.Future<String> verifyPasswordResetCode({
    required _i2.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _i3.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i4.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i3.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// Exposes the signed-in user's real profile data (email, display name,
/// username, avatar) to the app. A profile row is created automatically for
/// every account when it finishes registration (see
/// `serverpod_auth_idp_server`'s email registration flow), pre-populated
/// with the account's real email address.
/// {@category Endpoint}
class EndpointUserProfile extends _i4.EndpointUserProfileEditBase {
  EndpointUserProfile(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userProfile';

  /// Removes the user's uploaded image, setting it to null.
  ///
  /// The client should handle displaying a placeholder for users without images.
  @override
  _i3.Future<_i4.UserProfileModel> removeUserImage() =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'removeUserImage',
        {},
      );

  /// Sets a new user image for the signed in user.
  @override
  _i3.Future<_i4.UserProfileModel> setUserImage(_i5.ByteData image) =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'setUserImage',
        {'image': image},
      );

  /// Changes the name of a user.
  @override
  _i3.Future<_i4.UserProfileModel> changeUserName(String? userName) =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'changeUserName',
        {'userName': userName},
      );

  /// Changes the full name of a user.
  @override
  _i3.Future<_i4.UserProfileModel> changeFullName(String? fullName) =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'changeFullName',
        {'fullName': fullName},
      );

  /// Returns the user profile of the current user.
  @override
  _i3.Future<_i4.UserProfileModel> get() =>
      caller.callServerEndpoint<_i4.UserProfileModel>(
        'userProfile',
        'get',
        {},
      );
}

/// Real direct-messaging between signed-in users: conversation list,
/// message history, sending, read receipts and finding people to message.
/// {@category Endpoint}
class EndpointChat extends _i2.EndpointRef {
  EndpointChat(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chat';

  /// Returns up to 20 real users whose name or username matches [query],
  /// excluding the signed-in user. Used by the "New Message" flow.
  _i3.Future<List<_i4.UserProfileModel>> searchUsers(String query) =>
      caller.callServerEndpoint<List<_i4.UserProfileModel>>(
        'chat',
        'searchUsers',
        {'query': query},
      );

  /// Returns the signed-in user's conversations, most recent first.
  _i3.Future<List<_i6.ChatConversationSummary>> listConversations() =>
      caller.callServerEndpoint<List<_i6.ChatConversationSummary>>(
        'chat',
        'listConversations',
        {},
      );

  /// Returns the message history with [partnerId], oldest first.
  _i3.Future<List<_i7.ChatMessage>> getMessages(
    _i2.UuidValue partnerId, {
    required int limit,
  }) => caller.callServerEndpoint<List<_i7.ChatMessage>>(
    'chat',
    'getMessages',
    {
      'partnerId': partnerId,
      'limit': limit,
    },
  );

  /// Sends a text message to [recipientId].
  _i3.Future<_i7.ChatMessage> sendMessage(
    _i2.UuidValue recipientId,
    String text,
  ) => caller.callServerEndpoint<_i7.ChatMessage>(
    'chat',
    'sendMessage',
    {
      'recipientId': recipientId,
      'text': text,
    },
  );

  /// Marks all messages from [partnerId] to the signed-in user as read.
  _i3.Future<void> markConversationRead(_i2.UuidValue partnerId) =>
      caller.callServerEndpoint<void>(
        'chat',
        'markConversationRead',
        {'partnerId': partnerId},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i2.EndpointRef {
  EndpointGreeting(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i3.Future<_i8.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i8.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// Stores uploaded photo/video bytes and returns a public URL. Backed by
/// Serverpod's default database-backed storage (see DatabaseCloudStorage) —
/// no external cloud storage account needed. Shared by post/story creation
/// (avatar uploads go through UserProfileEndpoint instead, which has its
/// own resizing logic).
/// {@category Endpoint}
class EndpointMedia extends _i2.EndpointRef {
  EndpointMedia(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'media';

  /// Uploads [bytes] and returns its public URL. [fileExtension] should be
  /// a plain extension like 'jpg', 'png' or 'mp4' (no leading dot).
  _i3.Future<String> upload(
    _i5.ByteData bytes,
    String fileExtension,
  ) => caller.callServerEndpoint<String>(
    'media',
    'upload',
    {
      'bytes': bytes,
      'fileExtension': fileExtension,
    },
  );
}

/// Real, database-backed notifications for the signed-in user.
/// {@category Endpoint}
class EndpointNotifications extends _i2.EndpointRef {
  EndpointNotifications(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notifications';

  /// Returns the signed-in user's notifications, most recent first.
  _i3.Future<List<_i9.AppNotification>> list() =>
      caller.callServerEndpoint<List<_i9.AppNotification>>(
        'notifications',
        'list',
        {},
      );

  /// Marks a single notification as read.
  _i3.Future<void> markRead(int notificationId) =>
      caller.callServerEndpoint<void>(
        'notifications',
        'markRead',
        {'notificationId': notificationId},
      );

  /// Marks all of the signed-in user's notifications as read.
  _i3.Future<void> markAllRead() => caller.callServerEndpoint<void>(
    'notifications',
    'markAllRead',
    {},
  );

  /// Creates a notification the signed-in user sends to themself, to
  /// confirm the notifications pipeline is working end to end.
  _i3.Future<_i9.AppNotification> sendTestNotification() =>
      caller.callServerEndpoint<_i9.AppNotification>(
        'notifications',
        'sendTestNotification',
        {},
      );
}

/// Real post creation, a ranked feed, likes and view counts.
/// {@category Endpoint}
class EndpointPost extends _i2.EndpointRef {
  EndpointPost(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'post';

  /// Creates a post. [mediaUrls] should already be uploaded via
  /// [MediaEndpoint.upload]. [mediaType] is 'none', 'image' or 'video'.
  _i3.Future<_i10.Post> createPost(
    String text,
    List<String> mediaUrls,
    String mediaType,
  ) => caller.callServerEndpoint<_i10.Post>(
    'post',
    'createPost',
    {
      'text': text,
      'mediaUrls': mediaUrls,
      'mediaType': mediaType,
    },
  );

  /// Returns a ranked feed of recent posts. Ranking is a simple, explainable
  /// "hot" score: engagement (likes + weighted comments) decayed by how long
  /// ago the post was made, so fresh posts with traction rise to the top
  /// without older popular posts dominating forever. This is intentionally
  /// simple and easy to retune as real usage data comes in.
  _i3.Future<List<_i11.PostFeedItem>> getFeed({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i11.PostFeedItem>>(
    'post',
    'getFeed',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  /// Returns the signed-in user's own posts, most recent first — used by
  /// the Profile screen's Posts tab and the Analytics screen.
  _i3.Future<List<_i11.PostFeedItem>> getMyPosts() =>
      caller.callServerEndpoint<List<_i11.PostFeedItem>>(
        'post',
        'getMyPosts',
        {},
      );

  /// Toggles whether the signed-in user likes [postId]. Returns the new
  /// like count.
  _i3.Future<int> toggleLike(int postId) => caller.callServerEndpoint<int>(
    'post',
    'toggleLike',
    {'postId': postId},
  );

  /// Increments the view count for [postId]. Best-effort: the client calls
  /// this once per post per session, so counts are approximate, not a
  /// unique-viewer count.
  _i3.Future<void> recordView(int postId) => caller.callServerEndpoint<void>(
    'post',
    'recordView',
    {'postId': postId},
  );
}

/// Tracks and reports whether users are currently online, based on a
/// periodic heartbeat call from the app while it's in the foreground.
/// {@category Endpoint}
class EndpointPresence extends _i2.EndpointRef {
  EndpointPresence(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'presence';

  /// Marks the signed-in user as active right now. Call this periodically
  /// (e.g. every 30s) while the app is in the foreground.
  _i3.Future<void> heartbeat() => caller.callServerEndpoint<void>(
    'presence',
    'heartbeat',
    {},
  );

  /// Returns whether [userId] is currently online.
  _i3.Future<_i12.PresenceStatus> getPresence(_i2.UuidValue userId) =>
      caller.callServerEndpoint<_i12.PresenceStatus>(
        'presence',
        'getPresence',
        {'userId': userId},
      );
}

/// Registers/unregisters this device's Firebase Cloud Messaging token so
/// the server can send it push notifications (e.g. for new chat messages).
/// {@category Endpoint}
class EndpointPush extends _i2.EndpointRef {
  EndpointPush(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'push';

  /// Registers or refreshes [token] for the signed-in user's device.
  _i3.Future<void> registerDeviceToken(
    String token,
    String platform,
  ) => caller.callServerEndpoint<void>(
    'push',
    'registerDeviceToken',
    {
      'token': token,
      'platform': platform,
    },
  );

  /// Removes [token], e.g. on sign-out, so this device stops receiving
  /// pushes for the account that was signed in.
  _i3.Future<void> unregisterDeviceToken(String token) =>
      caller.callServerEndpoint<void>(
        'push',
        'unregisterDeviceToken',
        {'token': token},
      );
}

/// Stories: 24h-expiring photo/video updates, grouped by author, with
/// seen/view tracking. Mirrors the pattern used by [PostEndpoint].
/// {@category Endpoint}
class EndpointStory extends _i2.EndpointRef {
  EndpointStory(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'story';

  /// Creates a story. [mediaUrl] should already be uploaded via
  /// [MediaEndpoint.upload]. Expires 24 hours from now.
  _i3.Future<_i13.Story> createStory(
    String mediaUrl,
    String mediaType,
  ) => caller.callServerEndpoint<_i13.Story>(
    'story',
    'createStory',
    {
      'mediaUrl': mediaUrl,
      'mediaType': mediaType,
    },
  );

  /// Returns active (non-expired) stories grouped by author. The signed-in
  /// user's own group (if any) always comes first; the rest are ordered
  /// unseen-first, then by most recent story.
  _i3.Future<List<_i14.StoryGroup>> getStoriesFeed() =>
      caller.callServerEndpoint<List<_i14.StoryGroup>>(
        'story',
        'getStoriesFeed',
        {},
      );

  /// Marks [storyId] as viewed by the signed-in user (idempotent) and bumps
  /// its view count the first time.
  _i3.Future<void> markStoryViewed(int storyId) =>
      caller.callServerEndpoint<void>(
        'story',
        'markStoryViewed',
        {'storyId': storyId},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_core = _i4.Caller(client);
    serverpod_auth_idp = _i1.Caller(client);
  }

  late final _i4.Caller serverpod_auth_core;

  late final _i1.Caller serverpod_auth_idp;
}

class Client extends _i2.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i2.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i2.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i15.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    userProfile = EndpointUserProfile(this);
    chat = EndpointChat(this);
    greeting = EndpointGreeting(this);
    media = EndpointMedia(this);
    notifications = EndpointNotifications(this);
    post = EndpointPost(this);
    presence = EndpointPresence(this);
    push = EndpointPush(this);
    story = EndpointStory(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointUserProfile userProfile;

  late final EndpointChat chat;

  late final EndpointGreeting greeting;

  late final EndpointMedia media;

  late final EndpointNotifications notifications;

  late final EndpointPost post;

  late final EndpointPresence presence;

  late final EndpointPush push;

  late final EndpointStory story;

  late final Modules modules;

  @override
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'userProfile': userProfile,
    'chat': chat,
    'greeting': greeting,
    'media': media,
    'notifications': notifications,
    'post': post,
    'presence': presence,
    'push': push,
    'story': story,
  };

  @override
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_core': modules.serverpod_auth_core,
    'serverpod_auth_idp': modules.serverpod_auth_idp,
  };
}
