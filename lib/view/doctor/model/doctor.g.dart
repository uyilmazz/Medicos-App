// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
      about: json['about'] as String?,
      experience: json['experience'] as int?,
      profilUrl: json['profilUrl'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      patience: json['patience'] as int?,
      available: json['available'] as bool?,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'department': instance.department,
      'about': instance.about,
      'experience': instance.experience,
      'profilUrl': instance.profilUrl,
      'rate': instance.rate,
      'patience': instance.patience,
      'available': instance.available,
    };
