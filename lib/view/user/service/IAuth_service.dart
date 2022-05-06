import 'package:medicos_app/view/user/model/user.dart';

abstract class IAuthService {
  Future<User?> loginUser(String email, String password);
  Future<User?> registerUser(
      String name, String email, String phoneNumber, String password);
  Future<User?> verifyToken(String token);
  Future<bool> updatePassword(String newPassword, String userId);
  Future<User?> updateProfile(String? name, String? email, String? phoneNumber,
      String userId, String? imagePath);
}
