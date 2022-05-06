import 'package:json_annotation/json_annotation.dart';

import '../../pharmacy/model/product.dart';

part 'user_cart.g.dart';

@JsonSerializable()
class CartItem {
  Product? product;
  int? quantity;

  CartItem({this.product, this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
