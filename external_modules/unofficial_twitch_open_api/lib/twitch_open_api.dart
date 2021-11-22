import 'package:unofficial_twitch_open_api/channel/twitch_channel_information.dart';
import 'package:unofficial_twitch_open_api/channel/twitch_channel_information_impl.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search_impl.dart';

class TwitchOpenApi {
  final TwitchChannelInformation channelInformation;
  final TwitchSearch search;

  TwitchOpenApi()
      : channelInformation = TwitchChannelInformationImpl(),
        search = TwitchSearchImpl();
}
