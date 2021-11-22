import 'package:unofficial_twitch_auth/unofficial_twitch_auth.dart';

mixin AuthenticationMixin {
  Future<bool> validateToken(
    TwitchAuthentication authentication,
    String? token,
  ) async {
    if (token == null || token.isEmpty) return false;

    final validateResponse = await authentication.validate(
      accessToken: token,
    );

    return validateResponse.hasError || validateResponse.result!.hasError;
  }

  void revokeToken(
    TwitchAuthentication authentication,
    String? token,
  ) async {
    if (token == null || token.isEmpty) return;

    await authentication.revoke(
      accessToken: token,
    );
  }
}
