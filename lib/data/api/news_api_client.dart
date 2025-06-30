import 'package:dio/dio.dart';
import 'package:hacker_news_app/data/model/story_dto.dart';
import 'package:retrofit/retrofit.dart';

part '../../utils/generated/api/news_api_client.g.dart';

@RestApi(baseUrl: "https://hacker-news.firebaseio.com/v0")
abstract class NewsApiClient {
  factory NewsApiClient(final Dio dio, {String? baseUrl}) = _NewsApiClient;

  @GET('/topstories.json')
  Future<List<int>> getTopStories();

  @GET('/item/{id}.json')
  Future<StoryDto> getStoryById(@Path('id') int id);
}
