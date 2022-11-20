// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstateResponse _$EstateResponseFromJson(Map<String, dynamic> json) =>
    EstateResponse()
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => Estate.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$EstateResponseToJson(EstateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
