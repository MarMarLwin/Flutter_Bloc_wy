import 'package:json_annotation/json_annotation.dart';

part 'estate_feature.g.dart';

@JsonSerializable()
class EstateFeature{
  int? id;
  String? name;
  String? name_mm;



  EstateFeature();

  factory EstateFeature.fromJson(Map<String, dynamic> json) => _$EstateFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$EstateFeatureToJson(this);
}

