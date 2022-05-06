import 'dart:io';

import 'package:dio/dio.dart';
import 'package:medicos_app/view/pharmacy/model/product.dart';
import '../model/pharmacy.dart';
import 'IPharmacy_service.dart';

class PharmacyService extends IPharmacyService {
  static PharmacyService? _instance;
  static PharmacyService get instance => _instance ??= PharmacyService._init();

  late Dio dio;

  PharmacyService._init() {
    final _options = BaseOptions(baseUrl: 'http://10.0.2.2:3000');
    dio = Dio(_options);
  }

  @override
  Future<List<Pharmacy>?> getPharmacy(int? limit) async {
    try {
      final response =
          await dio.get('/categories', queryParameters: {"limit": limit});
      if (response.statusCode == HttpStatus.ok) {
        final responseDatas = List.castFrom(response.data);
        return responseDatas.map((data) => Pharmacy.fromJson(data)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<List<Product>?> getProducts(String? pharmacyId) async {
    try {
      final response = await dio
          .get('/products', queryParameters: {'categoryId': pharmacyId});
      if (response.statusCode == HttpStatus.ok) {
        final responseDatas = List.castFrom(response.data);
        return responseDatas.map((data) => Product.fromJson(data)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
