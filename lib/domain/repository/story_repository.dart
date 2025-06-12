import 'package:hacker_news_app/domain/entity/result.dart';
import 'package:hacker_news_app/domain/entity/story.dart';

abstract interface class StoryRepository {
  Future<Result<List<Story>>> getTopStories(final int page);
  bool hasMoreStories(final int currentPage);
}
