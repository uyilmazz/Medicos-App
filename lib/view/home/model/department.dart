import 'package:json_annotation/json_annotation.dart';
import 'medicine_model.dart';
part 'department.g.dart';

@JsonSerializable()
class Department extends MedicineModel {
  final String name;
  final String imageUrl;

  Department(this.name, this.imageUrl);

  static List<Department> getListFakeDepartment() {
    return [
      Department('Heart', 'Heart'),
      Department('Brain', 'Brain'),
      Department('Kidney', 'Kidney'),
      Department('Lung', 'Lung'),
    ];
  }

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}
