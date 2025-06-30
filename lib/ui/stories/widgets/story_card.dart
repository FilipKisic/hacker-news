import 'package:flutter/material.dart';
import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:hacker_news_app/ui/core/styles/style_extensions.dart';
import 'package:hacker_news_app/utils/date_time_extensions.dart';
import 'package:hugeicons/hugeicons.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          story.createdBy,
          style: context.textCardAuthor.copyWith(color: context.colorPrimary),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            story.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: context.textTitle.copyWith(color: context.colorText),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // CREATION DATE
            HugeIcon(
              icon: HugeIcons.strokeRoundedCalendar02,
              color: context.colorAccent,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              story.createdAt.toFormattedString(),
              style: context.textCardStats.copyWith(color: context.colorTextSecondary),
            ),
            const SizedBox(width: 30),

            // COMMENT COUNT
            HugeIcon(
              icon: HugeIcons.strokeRoundedComment01,
              color: context.colorAccent,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              story.commentCount.toString(),
              style: context.textCardStats.copyWith(color: context.colorTextSecondary),
            ),
            const SizedBox(width: 30),

            // SCORE COUNT
            HugeIcon(
              icon: HugeIcons.strokeRoundedThumbsUp,
              color: context.colorAccent,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              story.score.toString(),
              style: context.textCardStats.copyWith(color: context.colorTextSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
