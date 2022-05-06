import 'package:json_annotation/json_annotation.dart';

import '../../user/model/user_cart.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: "_id")
  String? id;
  String? orderCode;
  List<OrderItem>? orderItems;
  String? deliveryTime;
  double? totalAmount;
  String? email;
  String? address;
  String? userId;

  Order(
      {this.id,
      this.orderCode,
      this.orderItems,
      this.deliveryTime,
      this.totalAmount,
      this.email,
      this.address,
      this.userId});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class OrderItem {
  String? productId;
  int? quantity;

  OrderItem({this.productId, this.quantity});
  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
