import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/functionalities/home_screen/home_screen_viewmodel.dart';
import 'package:unofficial_twitch_mobile/functionalities/home_screen/home_screen_widget.dart';
import 'package:unofficial_twitch_mobile/functionalities/login_screen/login_screen_viewmodel.dart';
import 'package:unofficial_twitch_mobile/functionalities/login_screen/login_screen_widget.dart';
import 'package:unofficial_twitch_mobile/functionalities/login_webview/login_webview_viewmodel.dart';
import 'package:unofficial_twitch_mobile/functionalities/login_webview/login_webview_widget.dart';
import 'package:unofficial_twitch_navigation/unofficial_twitch_navigation.dart';

class RouteNavigation extends TwitchRouteNavigation<NameRoute> {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final RouteNavigation _instance = RouteNavigation._internal();

  factory RouteNavigation() {
    return _instance;
  }

  RouteNavigation._internal();

  @override
  String get initialRoute => NameRoute.loginScreen.routeName!;

  @override
  BuildContext get navigationContext => navigatorKey.currentState!.context;

  @override
  void pop<R>({
    R? result,
  }) {
    Navigator.pop(navigationContext, result);
  }

  @override
  void popUntil(NameRoute route) {
    Navigator.popUntil(
      navigationContext,
      (curr) => curr.settings.name == route.routeName,
    );
  }

  @override
  Future<R> pushNamed<R>(
    NameRoute to, {
    Map<String, dynamic>? arguments,
  }) async {
    assert(
      to.routeName != null,
      "Route name must not be null! If you see this exception, go to the"
      "route_navigation file and add the route on the extension.",
    );

    final result = await Navigator.pushNamed(
      navigationContext,
      to.routeName!,
      arguments: arguments,
    );

    return result as R;
  }

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    final route = settings.name!.route;

    switch (route) {
      case NameRoute.loginScreen:
        return _buildRoute(
          ChangeNotifierProvider(
            builder: (_, __) => const LoginScreenWidget(),
            create: (ctx) => LoginScreenViewModel(
              navigation: _getNavigation(ctx),
            ),
          ),
          settings,
        );
      case NameRoute.loginWebView:
        return _buildRoute(
          ChangeNotifierProvider(
            builder: (_, __) => const LoginWebViewWidget(),
            create: (ctx) => LoginWebViewViewModel(
              navigation: _getNavigation(ctx),
            ),
          ),
          settings,
        );
      case NameRoute.home:
        return _buildRoute(
          ChangeNotifierProvider(
            builder: (_, __) => const HomeScreenWidget(),
            create: (ctx) => HomeScreenViewModel(
              navigation: _getNavigation(ctx),
            ),
          ),
          settings,
        );
      default:
        return null;
    }
  }

  Route _buildRoute(Widget child, RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
  }

  RouteNavigation _getNavigation(BuildContext ctx) {
    return Provider.of<RouteNavigation>(ctx, listen: false);
  }
}

enum NameRoute {
  loginScreen,
  loginWebView,
  home,
}

extension NameRouteExt on NameRoute {
  String? get routeName => {
        NameRoute.home: '/home',
        NameRoute.loginScreen: '/splash',
        NameRoute.loginWebView: '/loginWebView',
      }[this];
}

extension NameRouteStr on String {
  NameRoute? get route => {
        '/splash': NameRoute.loginScreen,
        '/loginWebView': NameRoute.loginWebView,
        '/home': NameRoute.home,
      }[this];
}
