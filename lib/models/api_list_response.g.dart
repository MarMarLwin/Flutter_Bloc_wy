// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiListResponse _$ApiListResponseFromJson(Map<String, dynamic> json) =>
    ApiListResponse()
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList();

Map<String, dynamic> _$ApiListResponseToJson(ApiListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
