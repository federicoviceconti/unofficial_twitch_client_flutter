import 'package:unofficial_twitch_open_api/channel/twitch_channel_information.dart';
import 'package:unofficial_twitch_open_api/channel/twitch_channel_information_impl.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search_impl.dart';

class TwitchManagerOpenApi {
  static TwitchManagerOpenApi? _instance;

  TwitchManagerOpenApi._();

  factory TwitchManagerOpenApi() {
    _instance ??= TwitchManagerOpenApi._();
    return _instance!;
  }

  T of<T extends BaseTwitchOpenApi>() {
    assert(T is BaseTwitchOpenApi,
        'typeof($T) is not subclass of BaseTwitchOpenApi in TwitchManagerOpenApi.getInstance');

    if (T is TwitchChannelInformation) {
      return TwitchChannelInformationImpl() as T;
    } else if (T is TwitchSearch) {
      return TwitchSearchImpl() as T;
    }

    throw UnsupportedError(
        'typeof($T) is not implemented in TwitchManagerOpenApi.getInstance');
  }
}
