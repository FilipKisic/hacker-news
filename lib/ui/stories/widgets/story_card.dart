import 'package:flutter/material.dart';
import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:hacker_news_app/ui/core/styles/style_extensions.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({super.key, required this.story});

    @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('@filipkisic', style: context.textCardAuthor.copyWith(color: context.colorTextSecondary)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Apple reveals new design language on WWDC25',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: context.textTitle.copyWith(color: context.colorText),
                ),
              ),
              Image.network(
                'https://developer.apple.com/wwdc25/special-event/images/motion/apple-park-motion-still-first-large_2x.jpg',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.event_rounded, size: 16, color: context.colorTextSecondary),
            const SizedBox(width: 3),
            Text('10 Jun 2025', style: context.textCardStats.copyWith(color: context.colorTextSecondary)),
            const SizedBox(width: 30),
            
            Icon(Icons.chat_outlined, size: 16, color: context.colorTextSecondary),
            const SizedBox(width: 3),
            Text('69', style: context.textCardStats.copyWith(color: context.colorTextSecondary)),
            
            const SizedBox(width: 30),
            Icon(Icons.thumb_up_outlined, size: 16, color: context.colorTextSecondary),
            const SizedBox(width: 3),
            Text('420', style: context.textCardStats.copyWith(color: context.colorTextSecondary)),
          ],
        ),
      ],
    );
  }
}
