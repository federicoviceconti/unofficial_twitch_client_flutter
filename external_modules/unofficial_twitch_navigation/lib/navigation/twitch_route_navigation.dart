import 'package:flutter/material.dart';

abstract class TwitchRouteNavigation<T> {
  String get initialRoute;

  BuildContext get navigationContext;

  Future<R> pushNamed<R>(
    T to, {
    Map<String, dynamic>? arguments,
  });

  void pop<R>({
    R? result,
  });

  void popUntil(T route);

  Route? onGenerateRoute(RouteSettings settings);
}
