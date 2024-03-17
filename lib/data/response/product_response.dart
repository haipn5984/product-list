// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:product_list/domain/model/product_model.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'errorDescription')
  String? errorDescription;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'sku')
  String? sku;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'color')
  int? color;
  ProductResponse({
    this.id,
    this.errorDescription,
    this.name,
    this.sku,
    this.image,
    this.color,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  Product toModel() => Product(
        id: id ?? 0,
        name: name ?? '',
        sku: sku ?? '',
        image: image ?? '',
        color: color,
        errorDescription: errorDescription ?? '',
      );
}
