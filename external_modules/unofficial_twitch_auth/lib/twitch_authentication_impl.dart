import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_http/unofficial_twitch_http.dart';
import 'constants.dart';
import 'models/auth_revoke_response.dart';
import 'models/auth_validate_response.dart';
import 'models/login_scope.dart';
import 'twitch_authentication.dart';

/// Implementation of the [TwitchAuthentication] class
class TwitchAuthenticationImpl extends TwitchAuthentication {
  @override
  TwitchHttpClientImpl get client => TwitchHttpClientImpl(
          environmentBundle: EnvironmentBundle(
        basePath: TwitchAuthenticationConstants.baseUrl,
      ));

  @override
  String getLoginLink({
    required String clientId,
    required String redirect,
    List<LoginScope> scopes = const [LoginScope.openId],
  }) {
    return '${TwitchAuthenticationConstants.baseUrl}/oauth2/authorize?client_id=$clientId&redirect_uri=$redirect&response_type=token&scope=${_getScopes(scopes)}';
  }

  @override
  Future<HttpResult<AuthValidateResponse>> validate(
      {required String accessToken}) async {
    return await client.makeGet<AuthValidateResponse>(
      TwitchAuthenticationConstants.validateEndpoint,
      bearerToken: accessToken,
      convertBodyFunc: (response) =>
          AuthValidateResponse.fromHttpResponse(response.body),
    );
  }

  @override
  Future<HttpResult<AuthRevokeResponse>> revoke({
    required String accessToken,
    required String clientId,
  }) async {
    return await client.makeGet<AuthRevokeResponse>(
      TwitchAuthenticationConstants.revokeEndpoint,
      queryParameters: {
        TwitchAuthenticationConstants.clientIdParam: clientId,
        TwitchAuthenticationConstants.tokenParam: accessToken,
      },
      convertBodyFunc: (response) => AuthRevokeResponse.fromHttpResponse(
        response.statusCode,
        response.body,
      ),
    );
  }

  String _getScopes(List<LoginScope> scopes) {
    return scopes
        .map((scope) => scope.name)
        .reduce((value, element) => '$value $element');
  }
}
