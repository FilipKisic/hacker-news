import 'package:hacker_news_app/domain/entity/story.dart';

final class StoryListState {
  List<Story> storyList = [];
  
  int currentPage = 0;
  bool isLoading = true;
  bool hasMore = false;
  
  String errorMessage = '';
}