import '../model/product.dart';
import '../model/pharmacy.dart';

abstract class IPharmacyService {
  Future<List<Pharmacy>?> getPharmacy(int? limit);
  Future<List<Product>?> getProducts(String? pharmacyId);
}
