import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/core/styles/style_extensions.dart';

class ShowListScreen extends StatelessWidget {
  const ShowListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SafeArea(
        child: Center(child: Icon(Icons.preview_rounded, size: 120, color: context.colorText)),
      ),
    );
  }
}