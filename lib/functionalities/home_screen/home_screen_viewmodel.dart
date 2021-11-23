import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_open_api/unofficial_twitch_open_api.dart';

class HomeScreenViewModel extends BaseNotifier {
  final TwitchManagerOpenApi managerOpenApi;

  HomeScreenViewModel({
    required RouteNavigation navigation,
    required this.managerOpenApi,
  }) : super(navigation: navigation);

  void init() {

  }
}
