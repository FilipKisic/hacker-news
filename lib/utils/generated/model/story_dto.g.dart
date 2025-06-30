// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/model/story_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryDto _$StoryDtoFromJson(Map<String, dynamic> json) => StoryDto(
  by: json['by'] as String,
  descendants: (json['descendants'] as num?)?.toInt(),
  id: (json['id'] as num).toInt(),
  kids: (json['kids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  score: (json['score'] as num).toInt(),
  text: json['text'] as String?,
  time: (json['time'] as num).toInt(),
  title: json['title'] as String,
  url: json['url'] as String?,
);

Map<String, dynamic> _$StoryDtoToJson(StoryDto instance) => <String, dynamic>{
  'by': instance.by,
  'descendants': instance.descendants,
  'id': instance.id,
  'kids': instance.kids,
  'score': instance.score,
  'text': instance.text,
  'time': instance.time,
  'title': instance.title,
  'url': instance.url,
};
