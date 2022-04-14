import 'package:flutter/cupertino.dart';
import 'package:medicos_app/core/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../model/doctor.dart';
part 'doctor_view_model.g.dart';

class DoctorViewModel = _DoctorViewModelBase with _$DoctorViewModel;

abstract class _DoctorViewModelBase with Store, BaseViewModel {
  late BuildContext context;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  List<Doctor> fakeDoctorList = [];

  @override
  void init() {
    fakeDoctorList = Doctor.getFakeDoctorList();
  }
}
