import 'dart:io';
import 'package:dio/dio.dart';
import 'IDepartment_service.dart';
import '../model/department.dart';

class DepartmentService extends IDepartmentService {
  static DepartmentService? _instance;
  static DepartmentService get instance =>
      _instance ??= DepartmentService._init();

  late final Dio dio;

  DepartmentService._init() {
    final _options = BaseOptions(baseUrl: 'http://10.0.2.2:3000');
    dio = Dio(_options);
  }

  @override
  Future<List<Department>?> getDepartmentsLimit(int? limit) async {
    try {
      final response =
          await dio.get('/departments', queryParameters: {"limit": limit});
      if (response.statusCode == HttpStatus.ok) {
        final responseListData = List.castFrom(response.data);
        return responseListData
            .map((data) => Department.fromJson(data))
            .toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
