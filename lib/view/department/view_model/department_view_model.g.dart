// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DepartmentViewModel on _DepartmentViewModelBase, Store {
  final _$departmentsAtom = Atom(name: '_DepartmentViewModelBase.departments');

  @override
  List<Department>? get departments {
    _$departmentsAtom.reportRead();
    return super.departments;
  }

  @override
  set departments(List<Department>? value) {
    _$departmentsAtom.reportWrite(value, super.departments, () {
      super.departments = value;
    });
  }

  final _$getDepartmentsAsyncAction =
      AsyncAction('_DepartmentViewModelBase.getDepartments');

  @override
  Future<void> getDepartments({int? limit = 0}) {
    return _$getDepartmentsAsyncAction
        .run(() => super.getDepartments(limit: limit));
  }

  @override
  String toString() {
    return '''
departments: ${departments}
    ''';
  }
}
