import 'package:flutter/material.dart';
import 'package:unofficial_twitch_mobile/utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData.light();

  static final darkTheme = ThemeData.dark();

  static var themeMode = ThemeMode.system;

  static final theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryColor,
    backgroundColor: AppColor.black,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      hoverColor: AppColor.btnHoverColor,
      disabledColor: AppColor.btnDisabledColor,
    )
  );
}