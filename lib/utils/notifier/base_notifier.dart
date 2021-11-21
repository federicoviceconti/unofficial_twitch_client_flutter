import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/core/config/twitch_app_config.dart';
import 'package:unofficial_twitch_mobile/core/navigation/home/route_navigation.dart';
import 'package:unofficial_twitch_mobile/core/storage/twitch_storage_data.dart';

abstract class BaseNotifier extends ChangeNotifier {
  RouteNavigation navigation;

  TwitchAppConfig get appConfig => _getAppConfig();

  TwitchStorageData get persistData => _getPersistentStorageData();

  BaseNotifier({
    required this.navigation,
  });

  TwitchAppConfig _getAppConfig() {
    return Provider.of<TwitchAppConfig>(
      navigation.navigationContext,
      listen: false,
    );
  }

  TwitchStorageData _getPersistentStorageData() {
    return Provider.of<TwitchStorageData>(
      navigation.navigationContext,
      listen: false,
    );
  }
}
