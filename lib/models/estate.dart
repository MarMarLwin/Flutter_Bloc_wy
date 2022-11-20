import 'package:flutter_bloc_articles/models/estateType.dart';
import 'package:json_annotation/json_annotation.dart';
import 'estate_feature.dart';
import 'image_data.dart';

part 'estate.g.dart';

@JsonSerializable()
class Estate {
  int? id;
  String? title;
  String? code;
  String? description;
  String? address;
  int? single_bed_room;
  int? bathroom;
  int? master_bed_room;
  String? price;
  double? latitude;
  double? longitude;
  String? area_width;
  String? area_length;
  String? currency;
  String? area;
  String? owner_name;
  String? email;
  String? title_mm;
  String? type;
  String? description_mm;
  String? owner_name_mm;
  String? dimension;
  EstateType? estate_type;
  List<EstateFeature>? estate_features;
  String? phone_no;
  bool? weekdays;
  bool? weekends;
  bool? is_enable;
  int? floor;
  bool? sold_out;
  List<ImageData>? images;
  int? view_count;
  bool? favourite;
  String? deleted_at;
  int? updated_by;
  String? created_at;
  String? updated_at;
  String? error;

  Estate.withError(String errorMessage) {
    error = errorMessage;
  }
  Estate();

  factory Estate.fromJson(Map<String, dynamic> json) => _$EstateFromJson(json);

  Map<String, dynamic> toJson() => _$EstateToJson(this);


}
