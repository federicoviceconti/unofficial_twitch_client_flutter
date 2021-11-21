import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/core/config/app_config.dart';
import 'package:unofficial_twitch_mobile/core/config/twitch_app_config.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/core/storage/persistent_storage_data.dart';
import 'package:unofficial_twitch_mobile/core/storage/twitch_storage_data.dart';

abstract class BaseNotifier extends ChangeNotifier {
  RouteNavigation navigation;

  AppConfig get appConfig => _getAppConfig();

  PersistentStorageData get storageData => _getPersistentStorageData();

  BaseNotifier({
    required this.navigation,
  });

  AppConfig _getAppConfig() {
    return Provider.of<TwitchAppConfig>(
      navigation.navigationContext,
      listen: false,
    );
  }

  PersistentStorageData _getPersistentStorageData() {
    return Provider.of<TwitchStorageData>(
      navigation.navigationContext,
      listen: false,
    );
  }
}
