import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unofficial_twitch_mobile/core/app_config.dart';
import 'package:unofficial_twitch_mobile/core/twitch_app_config.dart';
import 'package:unofficial_twitch_mobile/navigation/home/route_navigation.dart';

abstract class BaseNotifier extends ChangeNotifier {
  RouteNavigation navigation;

  BaseNotifier({
    required this.navigation,
  });

  TwitchAppConfig getAppConfig() {
    return Provider.of<TwitchAppConfig>(
      navigation.navigationContext,
      listen: false,
    );
  }
}
