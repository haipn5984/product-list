// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:product_list/domain/model/color_model.dart';

part 'color_response.g.dart';

@JsonSerializable()
class ColorResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  ColorResponse({
    this.id,
    this.name,
  });

  factory ColorResponse.fromJson(Map<String, dynamic> json) =>
      _$ColorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ColorResponseToJson(this);

  ProductColor toModel() => ProductColor(id: id ?? 0, name: name ?? '');
}
