import 'package:json_annotation/json_annotation.dart';
part 'image_data.g.dart';

@JsonSerializable()
class ImageData{
  int? id;
  String? thumbnail_url;
  String? xsmall_url;
  String? small_url;
  String? medium_url;
  String? large_url;


  ImageData();
  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataToJson(this);

}