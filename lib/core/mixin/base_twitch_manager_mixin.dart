import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';
import 'package:unofficial_twitch_open_api/unofficial_twitch_open_api.dart';

mixin BaseTwitchManagerMixin on BaseNotifier {
  T getApiInstance<T extends BaseTwitchOpenApi>() {
    return getInstance<TwitchManagerOpenApi>()
        .of<T>(bearerToken: appConfig.accessToken);
  }
}
