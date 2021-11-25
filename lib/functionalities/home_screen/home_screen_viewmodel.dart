import 'package:unofficial_twitch_mobile/core/mixin/twitch_manager_information_mixin.dart';
import 'package:unofficial_twitch_mobile/core/mixin/twitch_manager_search_mixin.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';

class HomeScreenViewModel extends BaseNotifier
    with TwitchManagerSearchMixin, TwitchManagerInformationMixin {
  HomeScreenViewModel({
    required RouteNavigation navigation,
  }) : super(navigation: navigation);

  void init() {}

  void onTapInfo() async {
    
  }

  void onTapSearch() async {

  }
}
