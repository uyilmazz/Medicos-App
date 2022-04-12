// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$fakeDepartmentAtom = Atom(name: '_HomeViewModelBase.fakeDepartment');

  @override
  List<Department>? get fakeDepartment {
    _$fakeDepartmentAtom.reportRead();
    return super.fakeDepartment;
  }

  @override
  set fakeDepartment(List<Department>? value) {
    _$fakeDepartmentAtom.reportWrite(value, super.fakeDepartment, () {
      super.fakeDepartment = value;
    });
  }

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

  final _$fakePharmacyAtom = Atom(name: '_HomeViewModelBase.fakePharmacy');

  @override
  List<Pharmacy>? get fakePharmacy {
    _$fakePharmacyAtom.reportRead();
    return super.fakePharmacy;
  }

  @override
  set fakePharmacy(List<Pharmacy>? value) {
    _$fakePharmacyAtom.reportWrite(value, super.fakePharmacy, () {
      super.fakePharmacy = value;
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

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void changeBottomNavigationIten(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeBottomNavigationIten');
    try {
      return super.changeBottomNavigationIten(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fakeDepartment: ${fakeDepartment},
bottomNavigationBarIndex: ${bottomNavigationBarIndex},
fakePharmacy: ${fakePharmacy},
getAllDepartments: ${getAllDepartments}
    ''';
  }
}
