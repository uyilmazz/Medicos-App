import 'package:flutter/cupertino.dart';
import 'package:medicos_app/view/doctor/model/appointment.dart';
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

  int appointmentDayLenght = 7;

  @observable
  int scheduleDayIndex = 0;

  @observable
  List<Doctor>? doctors;

  @observable
  List<Appointment> moorningAppointments = [];

  @observable
  int morningSelectedItemIndex = -1;

  @observable
  List<Appointment> afternoonAppointments = [];

  @observable
  int afternoonSelectedItemIndex = -1;

  @observable
  List<Appointment> eveningAppointments = [];

  @observable
  int eveningSelectedItemIndex = -1;

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

  @action
  void changeScheduleDay(int index) {
    scheduleDayIndex = index;
  }

  @action
  Future<void> getAppointment(String? doctorId, String? date) async {
    List<Appointment> mornings = [];
    List<Appointment> afternoons = [];
    List<Appointment> evenings = [];
    final response = await _doctorService.getAppointment(
        doctorId: doctorId, date: date, isSelected: false);
    if (response != null && response.isNotEmpty) {
      for (var element in response) {
        if (element.date != null) {
          var date = DateTime.tryParse(element.date!);
          if (date != null && date.hour < 12) {
            mornings.add(element);
          } else if (date != null && date.hour >= 12 && date.hour < 18) {
            afternoons.add(element);
          } else {
            evenings.add(element);
          }
        }
      }
    }
    moorningAppointments = mornings;
    afternoonAppointments = afternoons;
    eveningAppointments = evenings;
  }

  @action
  void changeSelectedHours(String headText, int index) {
    if (headText == 'evening') {
      eveningSelectedItemIndex = index;
      morningSelectedItemIndex = -1;
      afternoonSelectedItemIndex = -1;
    } else if (headText == 'afternoon') {
      eveningSelectedItemIndex = -1;
      morningSelectedItemIndex = -1;
      afternoonSelectedItemIndex = index;
    } else if (headText == 'morning') {
      eveningSelectedItemIndex = -1;
      morningSelectedItemIndex = index;
      afternoonSelectedItemIndex = -1;
    } else {
      eveningSelectedItemIndex = -1;
      morningSelectedItemIndex = -1;
      afternoonSelectedItemIndex = -1;
    }
    print(index);
  }

  @action
  Appointment getConfirmAppointment() {
    if (morningSelectedItemIndex >= 0) {
      return moorningAppointments[morningSelectedItemIndex];
    } else if (afternoonSelectedItemIndex >= 0) {
      return afternoonAppointments[afternoonSelectedItemIndex];
    } else {
      return eveningAppointments[eveningSelectedItemIndex];
    }
  }

  @action
  bool selectedAppointmentControl() {
    return morningSelectedItemIndex >= 0 ||
            afternoonSelectedItemIndex >= 0 ||
            eveningSelectedItemIndex >= 0
        ? true
        : false;
  }

  @action
  Future<bool> makeAppointment(String userId, String appointmentId) async {
    final response = await _doctorService.makeAppointment(
        appointmentId: appointmentId, userId: userId);
    return response;
  }
}
