import 'package:medicos_app/view/pharmacy/model/product.dart';

import '../model/pharmacy.dart';

abstract class IPharmacyService {
  Future<List<Pharmacy>?> getPharmacy(int? limit);
  Future<List<Product>?> getProducts(String? pharmacyId);
}
