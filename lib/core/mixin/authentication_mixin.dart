import 'package:unofficial_twitch_auth/unofficial_twitch_auth.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';

mixin AuthenticationMixin on BaseNotifier {
  Future<bool> validateToken({
    String? accessToken,
  }) async {
    final validateResponse = await getAuthInstance().validate(
      accessToken: accessToken ?? appConfig.accessToken ?? '',
    );

    final hasError = validateResponse.result?.hasError ?? true;
    if(!hasError) {
      appConfig.update(accessToken: accessToken);
    }

    return !hasError;
  }

  void revokeToken() async {
    await getAuthInstance().revoke(
      accessToken: appConfig.accessToken ?? '',
      clientId: appConfig.clientId,
    );
  }

  TwitchAuthentication getAuthInstance() {
    return getInstance<TwitchAuthentication>();
  }
}
