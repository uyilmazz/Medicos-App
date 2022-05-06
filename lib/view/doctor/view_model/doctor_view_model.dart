import 'package:flutter/cupertino.dart';
import 'package:medicos_app/view/doctor/service/IDoctor_service.dart';
import 'package:medicos_app/view/doctor/service/doctor_service.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/view_model/base_view_model.dart';
import '../model/doctor.dart';

part 'doctor_view_model.g.dart';

class DoctorViewModel = _DoctorViewModelBase with _$DoctorViewModel;

abstract class _DoctorViewModelBase with Store, BaseViewModel {
  late BuildContext context;

  final IDoctorService _doctorService = DoctorService.instance;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  List<Doctor>? doctors;

  @override
  void init() {}

  @action
  Future<void> getDoctors(
      {bool? isAvailable, String? departmentId, String? searchText}) async {
    if (searchText != null) {
      doctors = await _doctorService.getDoctors(searchText: searchText);
    } else {
      doctors = await _doctorService.getDoctors(
          isAvailable: isAvailable, departmentId: departmentId);
    }
  }
}
