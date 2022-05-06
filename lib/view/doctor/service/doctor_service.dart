import 'dart:io';

import 'package:dio/dio.dart';
import 'package:medicos_app/view/doctor/service/IDoctor_service.dart';

import '../model/doctor.dart';

class DoctorService extends IDoctorService {
  static DoctorService? _instance;
  static DoctorService get instance => _instance ??= DoctorService._init();

  late final Dio dio;

  DoctorService._init() {
    final _options = BaseOptions(baseUrl: 'http://10.0.2.2:3000');
    dio = Dio(_options);
  }

  @override
  Future<List<Doctor>?> getDoctors(
      {bool? isAvailable, String? departmentId, String? searchText}) async {
    try {
      final response = await dio.get('/doctors', queryParameters: {
        "available": isAvailable,
        "departmentId": departmentId,
        "searchText": searchText
      });
      if (response.statusCode == HttpStatus.ok) {
        final responseListData = List.castFrom(response.data);

        return responseListData.map((data) => Doctor.fromJson(data)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // @override
  // Future<List<Doctor>?> getDoctorsBySearchText(String searchText) async {
  //   try {
  //     // final response = await dio.get('doctors',)

  //   } catch (e) {
  //     return null;
  //   }
  //   return null;
  // }
}
