import 'package:unofficial_twitch_mobile/core/config/app_config.dart';

class TwitchAppConfig extends AppConfig {
  static TwitchAppConfig? _instance;

  factory TwitchAppConfig({
    required String clientId,
    required String redirect,
  }) {
    _instance ??= TwitchAppConfig._(clientId, redirect);
    return _instance!;
  }

  TwitchAppConfig._(String clientId, String redirect)
      : super(
          clientId: clientId,
          redirect: redirect,
        );

  @override
  void update({
    String? accessToken,
    String? idToken,
    String? scope,
    String? tokenType,
  }) {
    if (accessToken != null) {
      this.accessToken = accessToken;
    }

    if (idToken != null) {
      this.idToken = idToken;
    }

    if (scope != null) {
      this.scope = scope;
    }

    if (tokenType != null) {
      this.tokenType = tokenType;
    }
  }
}
