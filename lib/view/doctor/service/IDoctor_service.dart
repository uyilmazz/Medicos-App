import 'package:medicos_app/view/doctor/model/doctor.dart';

abstract class IDoctorService {
  Future<List<Doctor>?> getDoctors(
      {bool? isAvailable, String? departmentId, String? searchText});
  // Future<List<Doctor>?> getDoctorsBySearchText(String searchText);
}
