import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_app/core/constants/constants_values.dart';
import 'package:fruits_app/core/theme/app_colors.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  appBarTheme: _appBarTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  textButtonTheme: _textButtonTheme,
  inputDecorationTheme: _inputDecorationTheme,
);

final AppBarThemeData _appBarTheme = const AppBarThemeData(
  backgroundColor: Colors.transparent,
  centerTitle: true,
  scrolledUnderElevation: 0,
  surfaceTintColor: Colors.transparent,
  titleTextStyle: TextStyle(
    fontFamily: "Cairo",
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 23,
  ),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ),
);

final ElevatedButtonThemeData _elevatedButtonTheme =
    const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    );

final TextButtonThemeData _textButtonTheme = const TextButtonThemeData(
  style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.black)),
);

final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(ConstantsValues.fullCircularRadius),
    borderSide: BorderSide(color: Colors.grey.shade300),
  ),
);
