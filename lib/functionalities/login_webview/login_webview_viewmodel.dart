import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_auth/twitch_authentication.dart';
import 'package:unofficial_twitch_mobile/core/mixin/authentication_mixin.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/core/storage/extension/persistent_storage_extension.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWebViewViewModel extends BaseNotifier with AuthenticationMixin {
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

  init() async {
    final accessTokenStorage = await persistData.accessToken;

    if (accessTokenStorage != null) {
      _handleStorageFlow(accessTokenStorage);
    } else {
      _initLinkFlow();
    }
  }

  void _handleStorageFlow(String accessTokenStorage) async {
    final isTokenValid = await validateToken(
      authentication,
      accessToken: accessTokenStorage,
    );

    if (isTokenValid) {
      navigation.pushNamed(NameRoute.home);
    } else {
      persistData.deleteAccessToken();
      init();
    }
  }

  void _initLinkFlow() {
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

      _handleUrl(url);
    } else if (error.failingUrl != null) {
      _handleUrl(error.failingUrl!);
    }
  }

  Future<void> _handleUrl(String url) async {
    final uri = Uri.parse(url.replaceFirst("#", "?"));

    appConfig.update(
      accessToken: uri.queryParameters['access_token'],
      idToken: uri.queryParameters['id_token'],
      scope: uri.queryParameters['scope'],
      tokenType: uri.queryParameters['token_type'],
    );

    if (appConfig.accessToken != null) {
      persistData.writeAccessToken(appConfig.accessToken!);
    }

    final isTokenValid = await validateToken(authentication);

    if (isTokenValid) {
      navigation.pushNamed(NameRoute.home);
    } else {
      revokeToken(authentication);

      persistData.deleteAccessToken();
      navigation.pop();
    }
  }
}
