import 'package:json_annotation/json_annotation.dart';
import '../../home/model/medicine_model.dart';
part 'department.g.dart';

@JsonSerializable()
class Department extends MedicineModel {
  final String? name;
  final String? imageUrl;

  Department(this.name, this.imageUrl);

  static List<Department> getListFakeDepartment() {
    return [
      Department('Heart', 'Heart'),
      Department('Brain', 'Brain'),
      Department('Kidney', 'Kidney'),
      Department('Lung', 'Lung'),
    ];
  }

  static List<Department> getAllFakeDepartments() {
    return [
      Department('Heart', 'Heart'),
      Department('Brain', 'Brain'),
      Department('Kidney', 'Kidney'),
      Department('Liver', 'Liver'),
      Department('Stomach', 'Stomach'),
      Department('Ear', 'Ear'),
      Department('Nose', 'Nose'),
      Department('Eye', 'Eye'),
      Department('Dental', 'tooth'),
      Department('Intestine', 'Intestine'),
    ];
  }

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}
