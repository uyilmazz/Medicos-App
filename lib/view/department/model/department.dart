import 'package:json_annotation/json_annotation.dart';
import '../../home/model/medicine_model.dart';

part 'department.g.dart';

@JsonSerializable()
class Department extends MedicineModel {
  @JsonKey(name: '_id')
  String? sId;
  String? name;
  String? imageUrl;

  Department({this.sId, this.name, this.imageUrl});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
