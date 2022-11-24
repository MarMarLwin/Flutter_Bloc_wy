import 'package:json_annotation/json_annotation.dart';

part 'api_list_response.g.dart';

@JsonSerializable()
class ApiListResponse {
  bool? success;
  String? message;
  List<Map<String, dynamic>>? data;
  // String? error;
  // //int? last_page;
  // ApiListResponse.withError(String errorMessage) {
  //   error = errorMessage;
  // }

  ApiListResponse();
  factory ApiListResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiListResponseToJson(this);
}
