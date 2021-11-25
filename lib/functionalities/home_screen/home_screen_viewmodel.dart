import 'package:flutter/foundation.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_open_api/channel/twitch_channel_information.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search.dart';
import 'package:unofficial_twitch_open_api/unofficial_twitch_open_api.dart';

class HomeScreenViewModel extends BaseNotifier {
  final TwitchManagerOpenApi managerOpenApi;

  HomeScreenViewModel({
    required RouteNavigation navigation,
    required this.managerOpenApi,
  }) : super(navigation: navigation);

  void init() {}

  void onTapInfo() async {
    final token = appConfig.accessToken;

    final info = managerOpenApi.of<TwitchChannelInformation>(
      bearerToken: token,
    );
  }

  void onTapSearch() async {
    final token = appConfig.accessToken;
    final search = managerOpenApi.of<TwitchSearch>(
      bearerToken: token,
    );
  }
}
