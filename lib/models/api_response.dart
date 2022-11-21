import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  bool? success;
  String? message;
  Map<String, dynamic>? data;
  // String? error;
  // //int? last_page;
  // ApiResponse.withError(String errorMessage) {
  //   error = errorMessage;
  // }

  ApiResponse();
  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
