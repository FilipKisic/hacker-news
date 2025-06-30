import 'dart:math' as math;

import 'package:hacker_news_app/data/api/news_api_client.dart';
import 'package:hacker_news_app/domain/entity/result.dart';
import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:hacker_news_app/domain/error/network_exception.dart';
import 'package:hacker_news_app/domain/repository/story_repository.dart';

final class StoryRepositoryImpl implements StoryRepository {
  final NewsApiClient _newsApi;
  final int _pageSize = 10;

  List<int> _topStories = [];

  StoryRepositoryImpl(this._newsApi);

  @override
  Future<Result<List<Story>>> getTopStories(final int page) async {
    try {
      if (_topStories.isEmpty || page == 0) {
        _topStories.clear();
        await _getTopStoriesIdList();
      }

      final nextPageStoryIdList = _getNextPageStoryIdList(page);
      if (nextPageStoryIdList.isEmpty) return Result.ok([]);

      final storyDtoList = await nextPageStoryIdList
          .map((storyId) async => _newsApi.getStoryById(storyId))
          .wait;
      final storyList = storyDtoList.map((dto) => dto.toDomain()).toList();
      return Result.ok(storyList);
    } catch (e) {
      return Result.error(NetworkException(e.toString()));
    }
  }

  Future<void> _getTopStoriesIdList() async => _topStories = await _newsApi.getTopStories();

  List<int> _getNextPageStoryIdList(final int page) {
    final startIndex = page * _pageSize;
    final endIndex = math.min(startIndex + _pageSize, _topStories.length);

    return startIndex >= _topStories.length ? [] : _topStories.sublist(startIndex, endIndex);
  }

  @override
  bool hasMoreStories(final int currentPage) => currentPage * _pageSize < _topStories.length;
}
