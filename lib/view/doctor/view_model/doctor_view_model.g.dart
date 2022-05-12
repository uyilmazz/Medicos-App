// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoctorViewModel on _DoctorViewModelBase, Store {
  final _$scheduleDayIndexAtom =
      Atom(name: '_DoctorViewModelBase.scheduleDayIndex');

  @override
  int get scheduleDayIndex {
    _$scheduleDayIndexAtom.reportRead();
    return super.scheduleDayIndex;
  }

  @override
  set scheduleDayIndex(int value) {
    _$scheduleDayIndexAtom.reportWrite(value, super.scheduleDayIndex, () {
      super.scheduleDayIndex = value;
    });
  }

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

  final _$moorningAppointmentsAtom =
      Atom(name: '_DoctorViewModelBase.moorningAppointments');

  @override
  List<Appointment> get moorningAppointments {
    _$moorningAppointmentsAtom.reportRead();
    return super.moorningAppointments;
  }

  @override
  set moorningAppointments(List<Appointment> value) {
    _$moorningAppointmentsAtom.reportWrite(value, super.moorningAppointments,
        () {
      super.moorningAppointments = value;
    });
  }

  final _$morningSelectedItemIndexAtom =
      Atom(name: '_DoctorViewModelBase.morningSelectedItemIndex');

  @override
  int get morningSelectedItemIndex {
    _$morningSelectedItemIndexAtom.reportRead();
    return super.morningSelectedItemIndex;
  }

  @override
  set morningSelectedItemIndex(int value) {
    _$morningSelectedItemIndexAtom
        .reportWrite(value, super.morningSelectedItemIndex, () {
      super.morningSelectedItemIndex = value;
    });
  }

  final _$afternoonAppointmentsAtom =
      Atom(name: '_DoctorViewModelBase.afternoonAppointments');

  @override
  List<Appointment> get afternoonAppointments {
    _$afternoonAppointmentsAtom.reportRead();
    return super.afternoonAppointments;
  }

  @override
  set afternoonAppointments(List<Appointment> value) {
    _$afternoonAppointmentsAtom.reportWrite(value, super.afternoonAppointments,
        () {
      super.afternoonAppointments = value;
    });
  }

  final _$afternoonSelectedItemIndexAtom =
      Atom(name: '_DoctorViewModelBase.afternoonSelectedItemIndex');

  @override
  int get afternoonSelectedItemIndex {
    _$afternoonSelectedItemIndexAtom.reportRead();
    return super.afternoonSelectedItemIndex;
  }

  @override
  set afternoonSelectedItemIndex(int value) {
    _$afternoonSelectedItemIndexAtom
        .reportWrite(value, super.afternoonSelectedItemIndex, () {
      super.afternoonSelectedItemIndex = value;
    });
  }

  final _$eveningAppointmentsAtom =
      Atom(name: '_DoctorViewModelBase.eveningAppointments');

  @override
  List<Appointment> get eveningAppointments {
    _$eveningAppointmentsAtom.reportRead();
    return super.eveningAppointments;
  }

  @override
  set eveningAppointments(List<Appointment> value) {
    _$eveningAppointmentsAtom.reportWrite(value, super.eveningAppointments, () {
      super.eveningAppointments = value;
    });
  }

  final _$eveningSelectedItemIndexAtom =
      Atom(name: '_DoctorViewModelBase.eveningSelectedItemIndex');

  @override
  int get eveningSelectedItemIndex {
    _$eveningSelectedItemIndexAtom.reportRead();
    return super.eveningSelectedItemIndex;
  }

  @override
  set eveningSelectedItemIndex(int value) {
    _$eveningSelectedItemIndexAtom
        .reportWrite(value, super.eveningSelectedItemIndex, () {
      super.eveningSelectedItemIndex = value;
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

  final _$getAppointmentAsyncAction =
      AsyncAction('_DoctorViewModelBase.getAppointment');

  @override
  Future<void> getAppointment(String? doctorId, String? date) {
    return _$getAppointmentAsyncAction
        .run(() => super.getAppointment(doctorId, date));
  }

  final _$makeAppointmentAsyncAction =
      AsyncAction('_DoctorViewModelBase.makeAppointment');

  @override
  Future<bool> makeAppointment(String userId, String appointmentId) {
    return _$makeAppointmentAsyncAction
        .run(() => super.makeAppointment(userId, appointmentId));
  }

  final _$_DoctorViewModelBaseActionController =
      ActionController(name: '_DoctorViewModelBase');

  @override
  void changeScheduleDay(int index) {
    final _$actionInfo = _$_DoctorViewModelBaseActionController.startAction(
        name: '_DoctorViewModelBase.changeScheduleDay');
    try {
      return super.changeScheduleDay(index);
    } finally {
      _$_DoctorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedHours(String headText, int index) {
    final _$actionInfo = _$_DoctorViewModelBaseActionController.startAction(
        name: '_DoctorViewModelBase.changeSelectedHours');
    try {
      return super.changeSelectedHours(headText, index);
    } finally {
      _$_DoctorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Appointment getConfirmAppointment() {
    final _$actionInfo = _$_DoctorViewModelBaseActionController.startAction(
        name: '_DoctorViewModelBase.getConfirmAppointment');
    try {
      return super.getConfirmAppointment();
    } finally {
      _$_DoctorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool selectedAppointmentControl() {
    final _$actionInfo = _$_DoctorViewModelBaseActionController.startAction(
        name: '_DoctorViewModelBase.selectedAppointmentControl');
    try {
      return super.selectedAppointmentControl();
    } finally {
      _$_DoctorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scheduleDayIndex: ${scheduleDayIndex},
doctors: ${doctors},
moorningAppointments: ${moorningAppointments},
morningSelectedItemIndex: ${morningSelectedItemIndex},
afternoonAppointments: ${afternoonAppointments},
afternoonSelectedItemIndex: ${afternoonSelectedItemIndex},
eveningAppointments: ${eveningAppointments},
eveningSelectedItemIndex: ${eveningSelectedItemIndex}
    ''';
  }
}
