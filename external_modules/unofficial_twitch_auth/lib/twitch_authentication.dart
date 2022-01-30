import 'package:unofficial_twitch_http/twitch_http_client.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

import 'models/auth_revoke_response.dart';
import 'models/auth_validate_response.dart';
import 'models/login_scope.dart';

abstract class TwitchAuthentication {
  TwitchHttpClient get client;

  /// The purpose of the method is to return the login link for retrieving
  /// access information using the OAuth protocols
  ///
  /// The [clientId] and [redirect] params are required, because the process cannot
  /// be finalized.
  /// The [scopes] determine the level of access to the twitch resources. To
  /// know more about scopes, read at the link:
  /// https://dev.twitch.tv/docs/authentication#scopes
  ///
  /// For more information for the authentication process, please read the
  /// link below: https://dev.twitch.tv/docs/authentication
  String getLoginLink({
    required String clientId,
    required String redirect,
    List<LoginScope> scopes = const [LoginScope.openId]
  });

  /// Validate the token retrieved via the OAuth process.
  ///
  /// For more information, please read the link below:
  /// https://dev.twitch.tv/docs/authentication#validating-requests
  Future<HttpResult<AuthValidateResponse>> validate({
    required String accessToken
  });

  /// Revoke the token acquired during the OAuth process.
  ///
  /// For more information, please read the link below:
  /// https://dev.twitch.tv/docs/authentication#revoking-access-tokens
  Future<HttpResult<AuthRevokeResponse>> revoke({
    required String accessToken,
    required String clientId,
  });
}
