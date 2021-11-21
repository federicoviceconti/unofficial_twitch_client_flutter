import 'package:unofficial_twitch_http/twitch_http_client_impl.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

import 'models/auth_revoke_response.dart';
import 'models/auth_validate_response.dart';

abstract class TwitchAuthentication {
  TwitchHttpClientImpl get client;

  String getLoginLink({
    required String clientId,
    required String redirect,
  });

  Future<HttpResult<AuthValidateResponse>> validate({
    required String accessToken,
  });

  Future<HttpResult<AuthRevokeResponse>> revoke({
    required String accessToken,
  });
}
