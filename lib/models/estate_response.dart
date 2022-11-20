import 'package:json_annotation/json_annotation.dart';

import 'estate.dart';

part 'estate_response.g.dart';

@JsonSerializable()
class EstateResponse{
  bool? success;
  String? message;
  List<Estate>? data;
  String? error;
  //int? last_page;
  EstateResponse.withError(String errorMessage) {
    error = errorMessage;
  }

  EstateResponse();
  factory EstateResponse.fromJson(Map<String, dynamic> json) => _$EstateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EstateResponseToJson(this);

}