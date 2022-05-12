import '../model/user.dart';
import '../../doctor/model/appointment.dart';

abstract class IAuthService {
  Future<User?> loginUser(String email, String password);
  Future<User?> registerUser(
      String name, String email, String phoneNumber, String password);
  Future<User?> verifyToken(String token);
  Future<bool> updatePassword(String newPassword, String userId);
  Future<User?> updateProfile(String? name, String? email, String? phoneNumber,
      String userId, String? imagePath);
  Future<List<Appointment>?> getAppointmentByUserId(
      {String? userId, bool isUpComing = false});
  Future<bool> cancelAppointment(String appointmentId);
}
