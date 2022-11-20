import 'package:json_annotation/json_annotation.dart';

import 'image_data.dart';

part 'estateType.g.dart';

@JsonSerializable()
class EstateType{
  int? id;
  String? name;
  String? name_mm;
  ImageData? image;



  EstateType();

  factory EstateType.fromJson(Map<String, dynamic> json) => _$EstateTypeFromJson(json);

  Map<String, dynamic> toJson() => _$EstateTypeToJson(this);
}
