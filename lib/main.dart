import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:unofficial_twitch_auth/unofficial_twitch_auth.dart';
import 'package:unofficial_twitch_mobile/core/config/app_config.dart';
import 'package:unofficial_twitch_mobile/core/config/twitch_app_config.dart';
import 'package:unofficial_twitch_mobile/core/navigation/route_navigation.dart';
import 'package:unofficial_twitch_mobile/core/storage/twitch_storage_data.dart';
import 'package:unofficial_twitch_mobile/utils/app_theme.dart';
import 'package:unofficial_twitch_open_api/twitch_manager_open_api.dart';
import 'package:unofficial_twitch_store_local/unofficial_twitch_store_local.dart';

void main() {
  runApp(const UnofficialTwitchClientApp());
}

class UnofficialTwitchClientApp extends StatelessWidget {
  const UnofficialTwitchClientApp({Key? key}) : super(key: key);

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

  /// Create your own AppConfig and specify client_id and redirect URL.
  /// In this example will be used the [TwitchAppConfig].
  List<SingleChildWidget> _initProvider() {
    String clientId = const String.fromEnvironment('CLIENT_ID');

    return [
      Provider<TwitchPersistentStorageData>.value(
        value: TwitchStorageData(),
      ),
      Provider<AppConfig>.value(
        value: _getAppConfig(clientId),
      ),
      Provider.value(
        value: RouteNavigation(),
      ),
      Provider<TwitchAuthentication>(
        create: (ctx) => TwitchAuthenticationImpl(),
      ),
      Provider<TwitchManagerOpenApi>(
        create: (ctx) => TwitchManagerOpenApi(
          clientId: clientId,
        ),
      ),
    ];
  }

  TwitchAppConfig _getAppConfig(String clientId) {
    final appConfig = TwitchAppConfig(
      clientId: clientId,
      redirect: const String.fromEnvironment('REDIRECT'),
    );

    return appConfig;
  }
}
