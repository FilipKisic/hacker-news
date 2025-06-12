import 'package:flutter/material.dart';
import 'package:hacker_news_app/routes/app_router.dart';
import 'package:hacker_news_app/ui/core/themes/dark_theme.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hacker News',
      theme: darkTheme,
      initialRoute: AppRouter.homeScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
