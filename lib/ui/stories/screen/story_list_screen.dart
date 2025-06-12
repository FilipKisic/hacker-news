import 'package:flutter/material.dart';
import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:hacker_news_app/ui/stories/widgets/story_card.dart';

class StoryListScreen extends StatefulWidget {
  const StoryListScreen({super.key});

  @override
  State<StoryListScreen> createState() => _StoryListScreenState();
}

class _StoryListScreenState extends State<StoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            StoryCard(
              story: Story(
                id: 1,
                title: 'title',
                createdAt: DateTime.now(),
                createdBy: 'createdBy',
                score: 2,
                commentCount: 1,
                listOfComments: [],
              ),
            ),
            const SizedBox(height: 20),
            StoryCard(
              story: Story(
                id: 1,
                title: 'title',
                createdAt: DateTime.now(),
                createdBy: 'createdBy',
                score: 2,
                commentCount: 1,
                listOfComments: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             StoryCard(
//               story: Story(
//                 id: 1,
//                 title: 'title',
//                 createdAt: DateTime.now(),
//                 createdBy: 'createdBy',
//                 score: 2,
//                 commentCount: 1,
//                 listOfComments: [],
//               ),
//             ),
//             const SizedBox(height: 20),
//             StoryCard(
//               story: Story(
//                 id: 1,
//                 title: 'title',
//                 createdAt: DateTime.now(),
//                 createdBy: 'createdBy',
//                 score: 2,
//                 commentCount: 1,
//                 listOfComments: [],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
