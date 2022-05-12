import 'package:json_annotation/json_annotation.dart';
import '../../department/model/department.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  Department? department;
  String? about;
  int? experience;
  String? profilUrl;
  double? rate;
  int? patience;
  bool? available;

  Doctor(
      {this.id,
      this.name,
      this.department,
      this.about,
      this.experience,
      this.profilUrl,
      this.rate,
      this.patience,
      this.available});

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
