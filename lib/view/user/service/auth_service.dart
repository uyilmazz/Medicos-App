import 'dart:io';
import 'package:dio/dio.dart';
import '../../doctor/model/appointment.dart';
import '../model/user.dart';
import 'IAuth_service.dart';

class AuthService extends IAuthService {
  static AuthService? _instance;
  late Dio dio;
  static AuthService get instance => _instance ??= AuthService._init();

  AuthService._init() {
    final _options = BaseOptions(baseUrl: 'http://10.0.2.2:3000');
    dio = Dio(_options);
  }

  @override
  Future<User?> loginUser(String email, String password) async {
    try {
      final response = await dio
          .post('/users/login', data: {"email": email, "password": password});
      if (response.statusCode == HttpStatus.ok) {
        return User.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<User?> registerUser(
      String name, String email, String phoneNumber, String password) async {
    try {
      final response = await dio.post('/users/register', data: {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password
      });
      if (response.statusCode == HttpStatus.ok) {
        return User.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<User?> verifyToken(String token) async {
    try {
      final response =
          await dio.post('/users/verifyToken', data: {"token": token});
      if (response.statusCode == HttpStatus.ok) {
        return User.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<bool> updatePassword(String newPassword, String userId) async {
    try {
      final response = await dio.post('/users/updatePassword',
          data: {"newPassword": newPassword, "userId": userId});
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  @override
  Future<User?> updateProfile(String? name, String? email, String? phoneNumber,
      String userId, String? imagePath) async {
    final _image = imagePath != null
        ? await MultipartFile.fromFile(imagePath,
            filename: imagePath.split('/').last)
        : null;

    FormData _formData = FormData.fromMap({
      "image": _image,
      "name": name,
      "email": email,
      "phoneNumber": "phoneNumber",
      "userId": userId
    });

    try {
      final response = await dio.post('/users/updateProfile', data: _formData);
      if (response.statusCode == HttpStatus.ok) {
        return User.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<List<Appointment>?> getAppointmentByUserId(
      {String? userId, bool isUpComing = true}) async {
    try {
      final response = await dio.get('/users/appointments/$userId',
          queryParameters: {"isUpComing": isUpComing});
      if (response.statusCode == HttpStatus.ok) {
        final dataList = List.castFrom(response.data);
        return dataList.map((data) => Appointment.fromJson(data)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<bool> cancelAppointment(String appointmentId) async {
    try {
      final response = await dio.get('/appointments/cancelAppointment',
          queryParameters: {'appointmentId': appointmentId});
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
