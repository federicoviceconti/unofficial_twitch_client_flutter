import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';

class HomeScreenViewModel extends BaseNotifier {
  HomeScreenViewModel({
    required RouteNavigation navigation,
  }) : super(navigation: navigation);
}
