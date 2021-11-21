import 'package:unofficial_twitch_auth/unofficial_twitch_auth.dart';

mixin AuthenticationMixin {
  Future<bool> validateToken(
    TwitchAuthentication authentication,
    String token,
  ) async {
    final validateResponse = await authentication.validate(
      accessToken: token,
    );

    return validateResponse.hasError && validateResponse.result!.hasError;
  }
}
