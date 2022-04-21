import 'package:json_annotation/json_annotation.dart';

import '../../pharmacy/model/product.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? imageUrl;
  String? email;
  String? phoneNumber;
  String? address;
  Cart? cart;
  int? zipCode;

  User(
      {this.name,
      this.imageUrl,
      this.email,
      this.phoneNumber,
      this.address,
      this.cart,
      this.zipCode});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Cart {
  List<CartItems>? cartItems;

  Cart({this.cartItems});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class CartItems {
  Product? product;
  int? quantity;

  CartItems({this.product, this.quantity = 0});

  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}
