// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['_id'] as String?,
      date: json['date'] as String?,
      isSelected: json['isSelected'] as bool?,
      doctor: json['doctorId'] == null
          ? null
          : Doctor.fromJson(json['doctorId'] as Map<String, dynamic>),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'isSelected': instance.isSelected,
      'doctorId': instance.doctor,
      'userId': instance.userId,
    };
