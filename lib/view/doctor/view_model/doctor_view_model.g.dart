// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoctorViewModel on _DoctorViewModelBase, Store {
  final _$doctorsAtom = Atom(name: '_DoctorViewModelBase.doctors');

  @override
  List<Doctor>? get doctors {
    _$doctorsAtom.reportRead();
    return super.doctors;
  }

  @override
  set doctors(List<Doctor>? value) {
    _$doctorsAtom.reportWrite(value, super.doctors, () {
      super.doctors = value;
    });
  }

  final _$getDoctorsAsyncAction =
      AsyncAction('_DoctorViewModelBase.getDoctors');

  @override
  Future<void> getDoctors(
      {bool? isAvailable, String? departmentId, String? searchText}) {
    return _$getDoctorsAsyncAction.run(() => super.getDoctors(
        isAvailable: isAvailable,
        departmentId: departmentId,
        searchText: searchText));
  }

  @override
  String toString() {
    return '''
doctors: ${doctors}
    ''';
  }
}
