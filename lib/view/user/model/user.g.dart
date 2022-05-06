// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      sId: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      appointments: (json['appointments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      imageUrl: json['imageUrl'] as String?,
      zipCode: json['zipCode'] as int?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'appointments': instance.appointments,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'imageUrl': instance.imageUrl,
      'zipCode': instance.zipCode,
      'token': instance.token,
    };
