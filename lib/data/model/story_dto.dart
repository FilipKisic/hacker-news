import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../utils/generated/model/story_dto.g.dart';

@JsonSerializable()
class StoryDto {
  final String by;
  final int? descendants;
  final int id;
  final List<int>? kids;
  final int score;
  final String? text;
  final int time;
  final String title;
  final String? url;

  const StoryDto({
    required this.by,
    required this.descendants,
    required this.id,
    required this.kids,
    required this.score,
    this.text,
    required this.time,
    required this.title,
    this.url,
  });

  factory StoryDto.fromJson(Map<String, dynamic> json) =>
      _$StoryDtoFromJson(json);

  Story toDomain() {
    return Story(
      id: id,
      title: title,
      createdAt: DateTime.fromMillisecondsSinceEpoch(time * 1000),
      createdBy: by,
      score: score,
      commentCount: descendants ?? 0,
      listOfComments: kids ?? [],
      text: text,
      url: url,
    );
  }
}
