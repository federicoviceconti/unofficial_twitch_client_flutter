import 'package:unofficial_twitch_http/twitch_http_client.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

import 'models/auth_revoke_response.dart';
import 'models/auth_validate_response.dart';
import 'models/login_scope.dart';

abstract class TwitchAuthentication {
  TwitchHttpClient get client;

  String getLoginLink({
    required String clientId,
    required String redirect,
    List<LoginScope> scopes = const [LoginScope.openId]
  });

  Future<HttpResult<AuthValidateResponse>> validate({
    required String accessToken
  });

  Future<HttpResult<AuthRevokeResponse>> revoke({
    required String accessToken,
    required String clientId,
  });
}
