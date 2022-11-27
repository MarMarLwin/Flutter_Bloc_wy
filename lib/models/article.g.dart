// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article()
  ..name = json['name'] as String?
  ..description = json['description'] as String?
  ..description_plain_text = json['description_plain_text'] as String?
  ..released_at = json['released_at'] as String?
  ..free = json['free'] as bool?
  ..professional = json['professional'] as bool?
  ..parent_name = json['parent_name'] as String?;

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'description_plain_text': instance.description_plain_text,
      'released_at': instance.released_at,
      'free': instance.free,
      'professional': instance.professional,
      'parent_name': instance.parent_name,
    };
