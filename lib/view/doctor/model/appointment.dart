import 'package:json_annotation/json_annotation.dart';
import 'package:medicos_app/view/doctor/model/doctor.dart';

part 'appointment.g.dart';
// @JsonSerializable()
// class Appointment {
//   @JsonKey(name: '_id')
//   String? id;
//   String? date;
//   bool? isSelected;
//   String? doctorId;
//   String? userId;

//   Appointment(
//       {this.id, this.date, this.isSelected, this.doctorId, this.userId});

//   factory Appointment.fromJson(Map<String, dynamic> json) =>
//       _$AppointmentFromJson(json);

//   Map<String, dynamic> toJson() => _$AppointmentToJson(this);
// }
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
