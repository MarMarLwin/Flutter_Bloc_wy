// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Estate _$EstateFromJson(Map<String, dynamic> json) => Estate()
  ..id = json['id'] as int?
  ..title = json['title'] as String?
  ..code = json['code'] as String?
  ..description = json['description'] as String?
  ..address = json['address'] as String?
  ..single_bed_room = json['single_bed_room'] as int?
  ..bathroom = json['bathroom'] as int?
  ..master_bed_room = json['master_bed_room'] as int?
  ..price = json['price'] as String?
  ..latitude = (json['latitude'] as num?)?.toDouble()
  ..longitude = (json['longitude'] as num?)?.toDouble()
  ..area_width = json['area_width'] as String?
  ..area_length = json['area_length'] as String?
  ..currency = json['currency'] as String?
  ..area = json['area'] as String?
  ..owner_name = json['owner_name'] as String?
  ..email = json['email'] as String?
  ..title_mm = json['title_mm'] as String?
  ..type = json['type'] as String?
  ..description_mm = json['description_mm'] as String?
  ..owner_name_mm = json['owner_name_mm'] as String?
  ..dimension = json['dimension'] as String?
  ..estate_type = json['estate_type'] == null
      ? null
      : EstateType.fromJson(json['estate_type'] as Map<String, dynamic>)
  ..estate_features = (json['estate_features'] as List<dynamic>?)
      ?.map((e) => EstateFeature.fromJson(e as Map<String, dynamic>))
      .toList()
  ..phone_no = json['phone_no'] as String?
  ..weekdays = json['weekdays'] as bool?
  ..weekends = json['weekends'] as bool?
  ..is_enable = json['is_enable'] as bool?
  ..floor = json['floor'] as int?
  ..sold_out = json['sold_out'] as bool?
  ..images = (json['images'] as List<dynamic>?)
      ?.map((e) => ImageData.fromJson(e as Map<String, dynamic>))
      .toList()
  ..view_count = json['view_count'] as int?
  ..favourite = json['favourite'] as bool?
  ..deleted_at = json['deleted_at'] as String?
  ..updated_by = json['updated_by'] as int?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..error = json['error'] as String?;

Map<String, dynamic> _$EstateToJson(Estate instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'code': instance.code,
      'description': instance.description,
      'address': instance.address,
      'single_bed_room': instance.single_bed_room,
      'bathroom': instance.bathroom,
      'master_bed_room': instance.master_bed_room,
      'price': instance.price,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'area_width': instance.area_width,
      'area_length': instance.area_length,
      'currency': instance.currency,
      'area': instance.area,
      'owner_name': instance.owner_name,
      'email': instance.email,
      'title_mm': instance.title_mm,
      'type': instance.type,
      'description_mm': instance.description_mm,
      'owner_name_mm': instance.owner_name_mm,
      'dimension': instance.dimension,
      'estate_type': instance.estate_type,
      'estate_features': instance.estate_features,
      'phone_no': instance.phone_no,
      'weekdays': instance.weekdays,
      'weekends': instance.weekends,
      'is_enable': instance.is_enable,
      'floor': instance.floor,
      'sold_out': instance.sold_out,
      'images': instance.images,
      'view_count': instance.view_count,
      'favourite': instance.favourite,
      'deleted_at': instance.deleted_at,
      'updated_by': instance.updated_by,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'error': instance.error,
    };
