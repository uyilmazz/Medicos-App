import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  String? name;
  String? profileUrl;
  String? specialist;
  double? experience;
  double? rate;

  Doctor(
      {this.name,
      this.profileUrl,
      this.specialist,
      this.experience,
      this.rate});

  static List<Doctor> getFakeDoctorList() {
    return [
      Doctor(
          name: "Serena",
          experience: 4,
          profileUrl: "serena",
          rate: 3.5,
          specialist: 'Heart'),
      Doctor(
          name: "Albert Flores",
          experience: 2,
          profileUrl: "albert",
          rate: 2,
          specialist: 'Heart'),
      Doctor(
          name: "Jacob Jones",
          experience: 5,
          profileUrl: "jacob",
          rate: 5,
          specialist: 'Heart'),
      Doctor(
          name: "Devon Lane",
          experience: 1,
          profileUrl: "devon",
          rate: 4,
          specialist: 'Heart'),
      Doctor(
          name: "Ronald Richards",
          experience: 2.5,
          profileUrl: "ronald",
          rate: 3,
          specialist: 'Heart'),
    ];
  }

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
