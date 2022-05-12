import 'package:json_annotation/json_annotation.dart';
import 'doctor.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  @JsonKey(name: '_id')
  String? id;
  String? date;
  bool? isSelected;
  @JsonKey(name: 'doctorId')
  Doctor? doctor;
  String? userId;

  Appointment({this.id, this.date, this.isSelected, this.doctor, this.userId});

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
