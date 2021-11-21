import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_auth/twitch_authentication.dart';
import 'package:unofficial_twitch_mobile/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWebViewViewModel extends BaseNotifier {
  final TwitchAuthentication authentication;

  String? _url;

  String? get url => _url;

  LoginWebViewViewModel({
    required RouteNavigation navigation,
  })  : authentication =
            Provider.of<TwitchAuthentication>(navigation.navigationContext),
        super(
          navigation: navigation,
        );

  init() {
    final appConfig = getAppConfig();

    _url = authentication.getLoginLink(
      clientId: appConfig.clientId,
      redirect: appConfig.redirect,
    );

    notifyListeners();
  }

  onPageStarted(String url) {
    debugPrint(url);
  }

  onWebResourceError(WebResourceError error) {
    debugPrint(error.toString());

    const iosErrorKey = 'NSErrorFailingURLKey';
    if (error.description.contains(iosErrorKey)) {
      final startIndex = error.description.indexOf(iosErrorKey);
      final endIndex = error.description.indexOf(",", startIndex);
      final url = error.description.substring(
        startIndex + (iosErrorKey.length + 1),
        endIndex,
      );

      final uri = Uri.parse(url.replaceFirst("#", "?"));
      uri.queryParameters.forEach((key, value) {
        debugPrint('key $key value $value');
      });

      getAppConfig().update(
        accessToken: uri.queryParameters['access_token'],
        idToken: uri.queryParameters['id_token'],
        scope: uri.queryParameters['scope'],
        tokenType: uri.queryParameters['token_type'],
      );
      
      navigation.pop();
    }
  }
}
