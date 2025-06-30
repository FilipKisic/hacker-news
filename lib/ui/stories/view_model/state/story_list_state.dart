import 'package:hacker_news_app/domain/entity/story.dart';

sealed class StoryListState {}

class StoryListLoading extends StoryListState {}

class StoryListSuccess extends StoryListState {
  final List<Story> storyList;

  StoryListSuccess(this.storyList);
}

class StoryListLoadingMore extends StoryListState {
  final List<Story> storyList;

  StoryListLoadingMore(this.storyList);
}

class StoryListError extends StoryListState {
  final String errorMessage;

  StoryListError(this.errorMessage);
}

class StoryListLoadingMoreError extends StoryListState {
  final String errorMessage;

  StoryListLoadingMoreError(this.errorMessage);
}
