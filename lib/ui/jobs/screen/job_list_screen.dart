import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/core/styles/style_extensions.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SafeArea(
        child: Center(child: Icon(Icons.work_rounded, size: 120, color: context.colorText)),
      ),
    );
  }
}
