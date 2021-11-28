import 'package:unofficial_twitch_auth/unofficial_twitch_auth.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';

mixin AuthenticationMixin on BaseNotifier {
  Future<bool> validateToken({
    String? accessToken,
  }) async {
    final tokenToStore = accessToken ?? appConfig.accessToken ?? '';

    if(tokenToStore.isEmpty) {
      return false;
    } else {
      final validateResponse = await getAuthInstance().validate(
        accessToken: tokenToStore,
      );

      final hasError = validateResponse.result?.hasError ?? true;
      if(!hasError) {
        appConfig.update(accessToken: tokenToStore);
      }

      return !hasError;
    }
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
