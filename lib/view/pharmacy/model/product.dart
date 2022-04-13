import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String? name;
  final String? imageUrl;
  final double? rate;
  final double? price;
  final String? description;
  final String? usage;

  Product(this.name, this.imageUrl, this.rate, this.price, this.description,
      this.usage);

  static List<Product> getFakeProduct() {
    return [
      Product("Diabetes Meter", "Diabetes_Meter", 2, 30,
          "Diabetes Meter descripiton", "Diatebets Meter How To Use"),
      Product("BP Meter", "BP_Meter", 3.5, 20, 'BP Meter description',
          "BP Meter How To Use"),
      Product("Nebulizer", "Nebulizer", 4, 12, "Nebulizer description",
          "Nebulizer How To Use"),
      Product("Thermometer", "Thermometer", 5, 25, "Thermometer description",
          "Thermometer How To Use"),
    ];
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
