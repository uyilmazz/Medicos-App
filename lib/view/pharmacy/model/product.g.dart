// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      howToUse: json['howToUse'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'howToUse': instance.howToUse,
      'rate': instance.rate,
      'price': instance.price,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
    };
