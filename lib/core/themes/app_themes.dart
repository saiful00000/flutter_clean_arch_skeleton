import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_values.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    primaryColorDark: AppColors.primaryVariantLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    dialogBackgroundColor: AppColors.surfaceLight,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.onBackgroundLight),
      bodyMedium: TextStyle(color: AppColors.onBackgroundLight),
      bodySmall: TextStyle(color: AppColors.onBackgroundLight),
    ),
    appBarTheme: const AppBarTheme(
        color: AppColors.primaryLight,
        titleTextStyle: TextStyle(color: AppColors.onPrimaryLight, fontSize: 20),
        iconTheme: IconThemeData(
          color: Colors.white,
        )),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryLight),
        foregroundColor: WidgetStateProperty.all(AppColors.onPrimaryLight),
        textStyle: WidgetStateProperty.all(
          const TextStyle(color: AppColors.onPrimaryLight, fontWeight: FontWeight.bold),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
          ),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.surfaceLight,
      error: AppColors.errorLight,
      onPrimary: AppColors.onPrimaryLight,
      onSecondary: AppColors.onSecondaryLight,
      onSurface: AppColors.onSurfaceLight,
      onError: AppColors.onErrorLight,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    primaryColorDark: AppColors.primaryVariantDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    dialogBackgroundColor: AppColors.surfaceDark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.onBackgroundDark),
      bodyMedium: TextStyle(color: AppColors.onBackgroundDark),
      bodySmall: TextStyle(color: AppColors.onBackgroundDark),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryDark,
      titleTextStyle: TextStyle(color: AppColors.onPrimaryDark, fontSize: 20),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryDark),
        foregroundColor: WidgetStateProperty.all(AppColors.onPrimaryDark),
        textStyle: WidgetStateProperty.all(
          const TextStyle(color: AppColors.onPrimaryDark, fontWeight: FontWeight.bold),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
          ),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      surface: AppColors.surfaceDark,
      error: AppColors.errorDark,
      onPrimary: AppColors.onPrimaryDark,
      onSecondary: AppColors.onSecondaryDark,
      onSurface: AppColors.onSurfaceDark,
      onError: AppColors.onErrorDark,
    ),
  );
}
