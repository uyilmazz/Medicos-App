// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoctorViewModel on _DoctorViewModelBase, Store {
  final _$fakeDoctorListAtom =
      Atom(name: '_DoctorViewModelBase.fakeDoctorList');

  @override
  List<Doctor> get fakeDoctorList {
    _$fakeDoctorListAtom.reportRead();
    return super.fakeDoctorList;
  }

  @override
  set fakeDoctorList(List<Doctor> value) {
    _$fakeDoctorListAtom.reportWrite(value, super.fakeDoctorList, () {
      super.fakeDoctorList = value;
    });
  }

  @override
  String toString() {
    return '''
fakeDoctorList: ${fakeDoctorList}
    ''';
  }
}
