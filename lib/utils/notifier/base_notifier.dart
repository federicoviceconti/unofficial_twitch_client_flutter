import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/core/config/app_config.dart';
import 'package:unofficial_twitch_mobile/core/navigation/route_navigation.dart';
import 'package:unofficial_twitch_store_local/unofficial_twitch_store_local.dart';

abstract class BaseNotifier extends ChangeNotifier {
  RouteNavigation navigation;

  AppConfig get appConfig => _getAppConfig();

  TwitchPersistentStorageData get persistData => _getPersistentStorageData();

  BaseNotifier({
    required this.navigation,
  });

  AppConfig _getAppConfig() {
    return Provider.of<AppConfig>(
      navigation.navigationContext,
      listen: false,
    );
  }

  TwitchPersistentStorageData _getPersistentStorageData() {
    return getInstance<TwitchPersistentStorageData>();
  }

  T getInstance<T>() {
    return Provider.of<T>(
      navigation.navigationContext,
      listen: false,
    );
  }
}
