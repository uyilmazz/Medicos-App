import '../model/department.dart';

abstract class IDepartmentService {
  Future<List<Department>?> getDepartmentsLimit(int? limit);
}
