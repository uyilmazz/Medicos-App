import 'package:flutter/material.dart';
import 'package:medicos_app/core/base/view_model/base_view_model.dart';
import 'package:medicos_app/view/department/service/IDepartment_service.dart';
import 'package:medicos_app/view/department/service/department_service.dart';
import 'package:mobx/mobx.dart';

import '../model/department.dart';
part 'department_view_model.g.dart';

class DepartmentViewModel = _DepartmentViewModelBase with _$DepartmentViewModel;

abstract class _DepartmentViewModelBase with Store, BaseViewModel {
  late BuildContext context;

  final IDepartmentService _departmentService = DepartmentService.instance;

  @observable
  List<Department>? departments;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    getDepartments();
  }

  @action
  Future<void> getDepartments({int? limit = 0}) async {
    departments = await _departmentService.getDepartmentsLimit(limit);
  }
}
