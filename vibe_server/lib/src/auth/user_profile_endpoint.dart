import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

/// Exposes the signed-in user's real profile data (email, display name,
/// username, avatar) to the app. A profile row is created automatically for
/// every account when it finishes registration (see
/// `serverpod_auth_idp_server`'s email registration flow), pre-populated
/// with the account's real email address.
class UserProfileEndpoint extends UserProfileEditBaseEndpoint {}
