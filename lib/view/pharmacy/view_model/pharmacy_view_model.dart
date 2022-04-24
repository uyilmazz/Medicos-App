import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/view_model/base_view_model.dart';
import '../model/pharmacy.dart';
import '../model/product.dart';

part 'pharmacy_view_model.g.dart';

class PharmacyViewModel = _PharmacyViewModelBase with _$PharmacyViewModel;

abstract class _PharmacyViewModelBase with Store, BaseViewModel {
  late BuildContext context;

  @observable
  List<Pharmacy> fakePharmacyList = [];

  @observable
  int selectedItemIndex = 0;

  @observable
  List<Product>? products;

  @observable
  int pageBuilderIndex = 0;

  @override
  void setContext(BuildContext context) {
    context = context;
  }

  @override
  void init() {
    fakePharmacyList = Pharmacy.getFakePharmacyList();
    products = Product.getFakeProduct();
  }

  @action
  void changeTabBarItem(int index) {
    selectedItemIndex = index;
  }

  @action
  void changePageBuilderIndex(index) {
    pageBuilderIndex = index;
  }
}
