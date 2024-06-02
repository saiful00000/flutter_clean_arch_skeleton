import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/core/resources/app_strings.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/app_navigator.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/route_names.dart';

import 'core/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      navigatorKey: AppNavigator.navKey,
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: AppNavigator.generateRoutes,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
    );
  }
}
