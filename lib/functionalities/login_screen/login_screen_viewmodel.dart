import 'package:unofficial_twitch_mobile/core/mixin/authentication_mixin.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_mobile/core/storage/extension/persistent_storage_extension.dart';

class LoginScreenViewModel extends BaseNotifier with AuthenticationMixin {
  LoginScreenViewModel({
    required RouteNavigation navigation,
  }) : super(
          navigation: navigation,
        );

  void onTapGoToLogin() async {
    final token = await persistData.accessToken;
    final isValidToken = await validateToken(
      accessToken: token,
    );

    if (isValidToken) {
      navigation.pushNamed(NameRoute.home);
    } else {
      navigation.pushNamed(NameRoute.loginWebView);
    }
  }
}
