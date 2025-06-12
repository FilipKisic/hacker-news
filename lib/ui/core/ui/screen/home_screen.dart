import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/asks/screen/ask_list_screen.dart';
import 'package:hacker_news_app/ui/core/styles/style_extensions.dart';
import 'package:hacker_news_app/ui/jobs/screen/job_list_screen.dart';
import 'package:hacker_news_app/ui/shows/screen/show_list_screen.dart';
import 'package:hacker_news_app/ui/stories/screen/story_list_screen.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [
    StoryListScreen(),
    AskListScreen(),
    ShowListScreen(),
    JobListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hacker news",
          style: context.textAppBarTitle.copyWith(color: context.colorText),
        ),
        backgroundColor: context.colorBackground,
      ),
      body: _screens.elementAt(_selectedScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        onTap: _onScreenSelect,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedNews,
              color: _selectedScreenIndex == 0 ? context.colorAccent : context.colorTextSecondary,
              size: 28,
            ),
            label: 'Stories',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedBubbleChatQuestion,
              color: _selectedScreenIndex == 1 ? context.colorAccent : context.colorTextSecondary,
              size: 28,
            ),
            label: 'Ask',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedMessagePreview02,
              color: _selectedScreenIndex == 2 ? context.colorAccent : context.colorTextSecondary,
              size: 28,
            ),
            label: 'Show',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedWork,
              color: _selectedScreenIndex == 3 ? context.colorAccent : context.colorTextSecondary,
              size: 28,
            ),
            label: 'Job',
          ),
        ],
      ),
    );
  }

  void _onScreenSelect(final int index) => setState(() => _selectedScreenIndex = index);
}
