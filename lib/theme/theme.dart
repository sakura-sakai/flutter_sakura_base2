library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'color.dart';
part 'text.dart';

final kLightThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: AppColors.violet,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.violet,
  hintColor: Colors.grey,
  dividerTheme: const DividerThemeData(space: 1),
  scaffoldBackgroundColor: AppColors.white,
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: AppColors.violet,
      fontSize: FontSize.small,
    ),
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: AppColors.violet,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
);

final kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.violet[700],
  scaffoldBackgroundColor: Colors.grey[700],
  toggleableActiveColor: AppColors.violet,
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: AppColors.violet,
      fontSize: FontSize.small,
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: AppColors.violet[400],
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: AppColors.violet,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);

const _kAppBarTheme = AppBarTheme(
  centerTitle: true,
);
