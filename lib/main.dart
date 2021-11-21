import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:unofficial_twitch_auth/unofficial_twitch_auth.dart';
import 'package:unofficial_twitch_mobile/core/config/twitch_app_config.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/core/storage/persistent_storage_data.dart';
import 'package:unofficial_twitch_mobile/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _initProvider(),
      builder: (context, _) => _buildApp(context),
    );
  }

  _buildApp(BuildContext context) {
    final routeNavigation = Provider.of<RouteNavigation>(context);

    return MaterialApp(
      title: 'Unofficial Twitch Client',
      themeMode: AppTheme.themeMode,
      theme: AppTheme.theme,
      navigatorKey: RouteNavigation.navigatorKey,
      onGenerateRoute: routeNavigation.onGenerateRoute,
      initialRoute: routeNavigation.initialRoute,
    );
  }

  /// Override your own AppConfig to specify client_id and redirect URL
  List<SingleChildWidget> _initProvider() {
    return [
      Provider.value(
        value: TwitchStorageData(),
      ),
      Provider.value(
        value: TwitchAppConfig(
          clientId: const String.fromEnvironment('CLIENT_ID'),
          redirect: const String.fromEnvironment('REDIRECT'),
        ),
      ),
      Provider.value(
        value: RouteNavigation(),
      ),
      Provider<TwitchAuthentication>(
        create: (ctx) => TwitchAuthenticationImpl(),
      ),
    ];
  }
}
