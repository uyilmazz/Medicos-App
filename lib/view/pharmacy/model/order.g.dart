// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['_id'] as String?,
      orderCode: json['orderCode'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryTime: json['deliveryTime'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      email: json['email'] as String?,
      address: json['address'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      '_id': instance.id,
      'orderCode': instance.orderCode,
      'orderItems': instance.orderItems,
      'deliveryTime': instance.deliveryTime,
      'totalAmount': instance.totalAmount,
      'email': instance.email,
      'address': instance.address,
      'userId': instance.userId,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      productId: json['productId'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
