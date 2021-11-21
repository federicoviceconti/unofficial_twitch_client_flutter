import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/core/config/app_config.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/core/storage/persistent_storage_data.dart';

abstract class BaseNotifier extends ChangeNotifier {
  RouteNavigation navigation;

  AppConfig get appConfig => _getAppConfig();

  PersistentStorageData get persistData => _getPersistentStorageData();

  BaseNotifier({
    required this.navigation,
  });

  AppConfig _getAppConfig() {
    return Provider.of<AppConfig>(
      navigation.navigationContext,
      listen: false,
    );
  }

  PersistentStorageData _getPersistentStorageData() {
    return Provider.of<PersistentStorageData>(
      navigation.navigationContext,
      listen: false,
    );
  }
}
