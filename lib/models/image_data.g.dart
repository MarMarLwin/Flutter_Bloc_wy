// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData()
  ..id = json['id'] as int?
  ..thumbnail_url = json['thumbnail_url'] as String?
  ..xsmall_url = json['xsmall_url'] as String?
  ..small_url = json['small_url'] as String?
  ..medium_url = json['medium_url'] as String?
  ..large_url = json['large_url'] as String?;

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'id': instance.id,
      'thumbnail_url': instance.thumbnail_url,
      'xsmall_url': instance.xsmall_url,
      'small_url': instance.small_url,
      'medium_url': instance.medium_url,
      'large_url': instance.large_url,
    };
