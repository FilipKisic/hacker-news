import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/home/screen/home_screen.dart';

class AppRouter {
  static const homeScreen = '/';

  const AppRouter._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        throw RouteException('Route ${settings.name} not found...');
    }
  }
}

class RouteException implements Exception {
  const RouteException(String message) : super();
}
