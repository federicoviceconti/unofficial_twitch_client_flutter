import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:unofficial_twitch_mobile/core/mixin/authentication_mixin.dart';
import 'package:unofficial_twitch_mobile/core/navigation/route_navigation.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_store_local/local_storage/extension/twitch_persistent_storage_extension.dart';
import 'package:url_launcher/url_launcher.dart';

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
    } else if(kIsWeb) {
      final loginUrl = getUrlLogin();

      if(await canLaunch(loginUrl)) {
        launch(loginUrl);
      }
    } else {
      navigation.pushNamed(NameRoute.loginWebView);
    }
  }
}
