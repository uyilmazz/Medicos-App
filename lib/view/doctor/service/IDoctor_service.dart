import 'package:medicos_app/view/doctor/model/doctor.dart';

import '../model/appointment.dart';

abstract class IDoctorService {
  Future<List<Doctor>?> getDoctors(
      {bool? isAvailable, String? departmentId, String? searchText});
  Future<List<Appointment>?> getAppointment(
      {bool? isSelected, String? date, String? doctorId});
  Future<bool> makeAppointment({String? userId, String? appointmentId});
  // Future<List<Doctor>?> getDoctorsBySearchText(String searchText);
}
