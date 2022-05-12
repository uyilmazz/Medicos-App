import '../../../core/base/view_model/base_view_model.dart';
import '../service/IDepartment_service.dart';
import '../service/department_service.dart';
import 'package:mobx/mobx.dart';
import '../model/department.dart';
part 'department_view_model.g.dart';

class DepartmentViewModel = _DepartmentViewModelBase with _$DepartmentViewModel;

abstract class _DepartmentViewModelBase with Store, BaseViewModel {
  final IDepartmentService _departmentService = DepartmentService.instance;

  @observable
  List<Department>? departments;

  @override
  void init() {
    getDepartments();
  }

  @action
  Future<void> getDepartments({int? limit = 0}) async {
    departments = await _departmentService.getDepartmentsLimit(limit);
  }
}
