// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$bottomNavigationBarIndexAtom =
      Atom(name: '_HomeViewModelBase.bottomNavigationBarIndex');

  @override
  int get bottomNavigationBarIndex {
    _$bottomNavigationBarIndexAtom.reportRead();
    return super.bottomNavigationBarIndex;
  }

  @override
  set bottomNavigationBarIndex(int value) {
    _$bottomNavigationBarIndexAtom
        .reportWrite(value, super.bottomNavigationBarIndex, () {
      super.bottomNavigationBarIndex = value;
    });
  }

  final _$getAllDepartmentsAtom =
      Atom(name: '_HomeViewModelBase.getAllDepartments');

  @override
  List<Department>? get getAllDepartments {
    _$getAllDepartmentsAtom.reportRead();
    return super.getAllDepartments;
  }

  @override
  set getAllDepartments(List<Department>? value) {
    _$getAllDepartmentsAtom.reportWrite(value, super.getAllDepartments, () {
      super.getAllDepartments = value;
    });
  }

  final _$isOpenSettingAtom = Atom(name: '_HomeViewModelBase.isOpenSetting');

  @override
  bool get isOpenSetting {
    _$isOpenSettingAtom.reportRead();
    return super.isOpenSetting;
  }

  @override
  set isOpenSetting(bool value) {
    _$isOpenSettingAtom.reportWrite(value, super.isOpenSetting, () {
      super.isOpenSetting = value;
    });
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void changeOpenSettingState(bool value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeOpenSettingState');
    try {
      return super.changeOpenSettingState(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBottomNavigationItem(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeBottomNavigationItem');
    try {
      return super.changeBottomNavigationItem(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bottomNavigationBarIndex: ${bottomNavigationBarIndex},
getAllDepartments: ${getAllDepartments},
isOpenSetting: ${isOpenSetting}
    ''';
  }
}
