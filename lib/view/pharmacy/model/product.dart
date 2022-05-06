import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? description;
  String? howToUse;
  double? rate;
  double? price;
  List<String>? category;
  String? imageUrl;

  Product(
      {this.id,
      this.name,
      this.description,
      this.howToUse,
      this.rate,
      this.price,
      this.category,
      this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
