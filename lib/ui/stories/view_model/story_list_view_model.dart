import 'package:flutter/material.dart';
import 'package:hacker_news_app/domain/entity/result.dart';
import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:hacker_news_app/domain/repository/story_repository.dart';
import 'package:hacker_news_app/ui/stories/view_model/state/story_list_state.dart';

final class StoryListViewModel extends ChangeNotifier {
  final StoryRepository storyRepository;

  StoryListViewModel({required this.storyRepository}) {
    _loadTopStories();
  }

  late StoryListState _state;
  StoryListState get state => _state;

  Future<void> _loadTopStories() async {
    if (_state.isLoading || !_state.hasMore) return;

    _state.isLoading = true;
    notifyListeners();

    final result = await storyRepository.getTopStories(_state.currentPage);

    switch (result) {
      case Ok<List<Story>>():
        if (result.value.isEmpty) {
          _state.hasMore = false;
        } else {
          _state.storyList.addAll(result.value);
          _state.currentPage++;
          _state.hasMore = storyRepository.hasMoreStories(_state.currentPage);
        }
      case Error<List<Story>>():
        _state.storyList = [];
        _state.errorMessage = result.error.toString();
    }
    notifyListeners();
  }
}
