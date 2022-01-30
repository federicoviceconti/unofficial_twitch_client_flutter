import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_twitch_auth/models/auth_revoke_response.dart';
import 'package:unofficial_twitch_auth/models/auth_validate_response.dart';
import 'package:unofficial_twitch_auth/models/login_scope.dart';
import 'package:unofficial_twitch_auth/twitch_authentication.dart';
import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_http/twitch_http_client.dart';
import 'package:unofficial_twitch_http/twitch_http_client_impl.dart';

void main() {
  MockTwitchAuthImpl? auth;

  setUp(() {
    auth = MockTwitchAuthImpl();
  });

  tearDown(() {
    auth = null;
  });

  test('Should login link not be empty', () {
    final loginLink = auth?.getLoginLink(clientId: 'xxx', redirect: 'zzz');
    expect(loginLink, isNotEmpty);
  });

  test('revoke should return 200', () async {
    final revoke = await auth?.revoke(accessToken: 'zzz', clientId: 'zzz');
    equals(revoke!.result!.status, 200);
  });

  test('validate should return 200', () async {
    final validate = await auth?.validate(accessToken: 'zzz');
    equals(validate!.result!.status, 200);
  });
}

class MockTwitchAuthImpl extends TwitchAuthentication {
  @override
  TwitchHttpClient get client =>
      TwitchHttpClientImpl(environmentBundle: EnvironmentBundle(basePath: ''));

  @override
  String getLoginLink(
      {required String clientId,
      required String redirect,
      List<LoginScope> scopes = const [LoginScope.openId]}) {
    return 'http://localhost/mocklink';
  }

  @override
  Future<HttpResult<AuthRevokeResponse>> revoke(
      {required String accessToken, required String clientId}) {
    return Future.value(HttpResult(
      result: AuthRevokeResponse(
        status: 200,
        message: 'ok',
      ),
    ));
  }

  @override
  Future<HttpResult<AuthValidateResponse>> validate(
      {required String accessToken}) {
    return Future.value(
      HttpResult(
        result: AuthValidateResponse(
          status: 200,
          message: 'ok',
          clientId: 'xxx',
          userId: 'yyy',
          login: 'zzz',
          expiresIn: 90,
          scopes: [
            LoginScope.openId.name,
          ],
        ),
      ),
    );
  }
}
