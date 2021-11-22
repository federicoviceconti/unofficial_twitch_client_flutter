import 'package:provider/provider.dart';
import 'package:unofficial_twitch_auth/twitch_authentication.dart';
import 'package:unofficial_twitch_mobile/core/mixin/authentication_mixin.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/core/storage/extension/persistent_storage_extension.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';

class LoginScreenViewModel extends BaseNotifier with AuthenticationMixin {
  final TwitchAuthentication authentication;

  LoginScreenViewModel({
    required RouteNavigation navigation,
  })  : authentication =
            Provider.of<TwitchAuthentication>(navigation.navigationContext),
        super(
          navigation: navigation,
        );

  void onTapGoToLogin() async {
    final isValidToken = await validateToken(
      authentication,
      await persistData.accessToken,
    );

    if(isValidToken) {
      navigation.pushNamed(NameRoute.home);
    } else {
      navigation.pushNamed(NameRoute.loginWebView);
    }
  }
}
