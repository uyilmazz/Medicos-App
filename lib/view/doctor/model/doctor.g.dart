// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      name: json['name'] as String?,
      profileUrl: json['profileUrl'] as String?,
      specialist: json['specialist'] as String?,
      experience: (json['experience'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'name': instance.name,
      'profileUrl': instance.profileUrl,
      'specialist': instance.specialist,
      'experience': instance.experience,
      'rate': instance.rate,
    };
