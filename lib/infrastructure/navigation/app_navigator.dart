import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/infrastructure/navigation/route_names.dart';
import 'package:flutter_clean_skeleton/modules/github_users/presentation/screens/github_users_screen.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/screens/todo_create_screen.dart';
import 'package:flutter_clean_skeleton/modules/todo/presentation/screens/todo_list_screen.dart';

class AppNavigator {
  AppNavigator._();

  /// This field hold the state of [Navigator] widget
  /// which manage a stack of pages in the application
  ///
  /// This field will give the power to access of the
  /// application navigation outside of a context scope
  static final navKey = GlobalKey<NavigatorState>();

  /// This key is used to access the state of the ScaffoldMessenger
  /// widget, which provides the functionality to show snack bars,
  /// banners, and other persistent UI elements.
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// THis method return a instance of [PageRouteBuilder]
  /// main purpose of this method is to give a fade in
  /// animation transition when navigating from one
  /// screen to another screen
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return _getScreenByName(settings.name, settings.arguments);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0);
        // const end = Offset.zero;
        // final tween = Tween(begin: begin, end: end);
        // final offsetAnimation = animation.drive(tween);
        return FadeTransition(
          alwaysIncludeSemantics: true,
          opacity: animation,
          child: child,
        );
      },
    );
  }

  /// This method return a widget that represent a single screen
  static Widget _getScreenByName(String? name, Object? arguments) {
    switch (name) {
      case RouteNames.splashScreen:
        return Container();
      case RouteNames.githubUsersScreen:
        return const GithubUsersScreen();
      case RouteNames.todoListScreen:
        return const TodoListScreen();;
      case RouteNames.createTodoScreen:
        return CreateTodoScreen();
      default:
        return Container();
    }
  }
}
