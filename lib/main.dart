import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news_app/data/api/news_api_client.dart';
import 'package:hacker_news_app/data/repository/story_repository_impl.dart';
import 'package:hacker_news_app/domain/repository/story_repository.dart';
import 'package:hacker_news_app/routes/app_router.dart';
import 'package:hacker_news_app/ui/core/themes/dark_theme.dart';
import 'package:hacker_news_app/ui/stories/view_model/story_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      Provider(create: (_) => Dio()),
      Provider(create: (context) => NewsApiClient(context.read())),
      Provider(
        create: (context) =>
            StoryRepositoryImpl(context.read()) as StoryRepository,
      ),
      ChangeNotifierProvider(
        create: (context) =>
            StoryListViewModel(storyRepository: context.read()),
      ),
    ],
    child: const MainApp(),
  ),
);

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
