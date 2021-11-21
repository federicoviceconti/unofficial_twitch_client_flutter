import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';

class LoginScreenViewModel extends BaseNotifier {
  LoginScreenViewModel({
    required RouteNavigation navigation,
  }) : super(navigation: navigation);

  void onTapGoToLogin() {
    navigation.pushNamed(NameRoute.loginWebView);
  }
}
