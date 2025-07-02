import 'package:flutter/material.dart';
import 'package:hacker_news_app/domain/entity/result.dart';
import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:hacker_news_app/domain/repository/story_repository.dart';
import 'package:hacker_news_app/ui/stories/view_model/state/story_list_state.dart';

final class StoryListViewModel extends ChangeNotifier {
  final StoryRepository storyRepository;
  late StoryListState state;

  StoryListViewModel({required this.storyRepository}) {
    state = StoryListLoading();
    loadTopStories();
  }

  List<Story> storyList = [];
  final Set<int> _newlyLoadedIds = {};
  int _previousStoryListLength = 0;

  int currentPage = 0;
  bool hasMore = true;

  String errorMessage = '';

  Future<void> loadTopStories() async {
    if (state is StoryListLoadingMore || !hasMore) return;

    state = storyList.isEmpty ? StoryListLoading() : StoryListLoadingMore(storyList);
    notifyListeners();

    final result = await storyRepository.getTopStories(currentPage);

    switch (result) {
      case Ok<List<Story>>():
        if (result.value.isEmpty) {
          hasMore = false;
        } else {
          _previousStoryListLength = storyList.length;
          _newlyLoadedIds.addAll(result.value.map((story) => story.id));

          storyList.addAll(result.value);
          currentPage++;
          hasMore = storyRepository.hasMoreStories(currentPage);
        }
        state = StoryListSuccess(storyList);
      case Error<List<Story>>():
        final errorMessage = result.error.toString();
        state = storyList.isEmpty
            ? StoryListError(errorMessage)
            : StoryListLoadingMoreError(errorMessage);
    }
    notifyListeners();
  }

  bool isNewStory(final int storyId) => _newlyLoadedIds.contains(storyId);

  int getNewStoryIndex(final int storyId) {
    final newStories = storyList.skip(_previousStoryListLength).toList();
    return newStories.indexWhere((story) => story.id == storyId);
  }


  //TODO: Refresh method
}
