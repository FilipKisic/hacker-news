import 'package:flutter/material.dart';
import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:hacker_news_app/ui/core/styles/style_extensions.dart';
import 'package:hacker_news_app/ui/stories/view_model/state/story_list_state.dart';
import 'package:hacker_news_app/ui/stories/view_model/story_list_view_model.dart';
import 'package:hacker_news_app/ui/stories/widgets/story_card.dart';
import 'package:provider/provider.dart';

class StoryListScreen extends StatelessWidget {
  const StoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<StoryListViewModel>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return switch (viewModel.state) {
              StoryListLoading() => Center(
                child: CircularProgressIndicator.adaptive(backgroundColor: context.colorPrimary),
              ),
              StoryListSuccess(storyList: final result) ||
              StoryListLoadingMore(storyList: final result) => StoryList(
                storyList: result,
                viewModel: viewModel,
              ),
              StoryListError() => Text("There was an error"),
              StoryListLoadingMoreError() => Text("Error while loading more..."),
            };
          },
        ),
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  final List<Story> storyList;
  final StoryListViewModel viewModel;

  const StoryList({
    super.key,
    required this.storyList,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: storyList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (_, index) {
        if (index == storyList.length - 1 && viewModel.state is StoryListLoadingMore) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(child: CircularProgressIndicator.adaptive(backgroundColor: context.colorPrimary)),
          );
        }

        if (index == storyList.length - 1 &&
            viewModel.hasMore &&
            viewModel.state is! StoryListLoadingMore) {
          WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.loadTopStories());
        }

        final story = storyList[index];
        final isNew = viewModel.isNewStory(story.id);

        if (!isNew) {
          return StoryCard(story: story);
        }

        final newItemIndex = viewModel.getNewStoryIndex(story.id);

        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 500 + (newItemIndex * 100)),
          tween: Tween(begin: 0.0, end: 1.0),
          curve: Curves.easeOutCubic,
          builder: (context, value, _) {
            return Transform.translate(
              offset: Offset(0, 30 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: StoryCard(story: story),
              ),
            );
          },
        );
      },
    );
  }
}
