// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estateType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstateType _$EstateTypeFromJson(Map<String, dynamic> json) => EstateType()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..name_mm = json['name_mm'] as String?
  ..image = json['image'] == null
      ? null
      : ImageData.fromJson(json['image'] as Map<String, dynamic>);

Map<String, dynamic> _$EstateTypeToJson(EstateType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_mm': instance.name_mm,
      'image': instance.image,
    };
