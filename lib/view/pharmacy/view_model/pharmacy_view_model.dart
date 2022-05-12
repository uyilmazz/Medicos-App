import '../service/IPharmacy_service.dart';
import '../service/pharmacy_service.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/view_model/base_view_model.dart';
import '../model/pharmacy.dart';
import '../model/product.dart';

part 'pharmacy_view_model.g.dart';

class PharmacyViewModel = _PharmacyViewModelBase with _$PharmacyViewModel;

abstract class _PharmacyViewModelBase with Store, BaseViewModel {
  final IPharmacyService _pharmacyService = PharmacyService.instance;

  @observable
  List<Pharmacy>? pharmacy;

  @observable
  int selectedItemIndex = 0;

  @observable
  List<Product>? products;

  @observable
  int pageBuilderIndex = 0;

  @override
  Future<void> init() async {
    await getPharmacy();
    await getProducts();
  }

  @action
  Future<void> getPharmacy({int? limit = 0}) async {
    pharmacy = await _pharmacyService.getPharmacy(limit);
  }

  @action
  Future<void> getProducts() async {
    final pharmacyId = pharmacy?[selectedItemIndex].sId;
    products = await _pharmacyService.getProducts(pharmacyId);
  }

  @action
  Future<void> changeTabBarItem(int index) async {
    selectedItemIndex = index;
    await getProducts();
  }

  @action
  void changePageBuilderIndex(index) {
    pageBuilderIndex = index;
  }
}
