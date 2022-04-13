// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['name'] as String?,
      json['imageUrl'] as String?,
      (json['rate'] as num?)?.toDouble(),
      (json['price'] as num?)?.toDouble(),
      json['description'] as String?,
      json['usage'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'rate': instance.rate,
      'price': instance.price,
      'description': instance.description,
      'usage': instance.usage,
    };
