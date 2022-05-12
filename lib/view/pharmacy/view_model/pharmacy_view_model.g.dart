// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PharmacyViewModel on _PharmacyViewModelBase, Store {
  final _$pharmacyAtom = Atom(name: '_PharmacyViewModelBase.pharmacy');

  @override
  List<Pharmacy>? get pharmacy {
    _$pharmacyAtom.reportRead();
    return super.pharmacy;
  }

  @override
  set pharmacy(List<Pharmacy>? value) {
    _$pharmacyAtom.reportWrite(value, super.pharmacy, () {
      super.pharmacy = value;
    });
  }

  final _$selectedItemIndexAtom =
      Atom(name: '_PharmacyViewModelBase.selectedItemIndex');

  @override
  int get selectedItemIndex {
    _$selectedItemIndexAtom.reportRead();
    return super.selectedItemIndex;
  }

  @override
  set selectedItemIndex(int value) {
    _$selectedItemIndexAtom.reportWrite(value, super.selectedItemIndex, () {
      super.selectedItemIndex = value;
    });
  }

  final _$productsAtom = Atom(name: '_PharmacyViewModelBase.products');

  @override
  List<Product>? get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product>? value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$pageBuilderIndexAtom =
      Atom(name: '_PharmacyViewModelBase.pageBuilderIndex');

  @override
  int get pageBuilderIndex {
    _$pageBuilderIndexAtom.reportRead();
    return super.pageBuilderIndex;
  }

  @override
  set pageBuilderIndex(int value) {
    _$pageBuilderIndexAtom.reportWrite(value, super.pageBuilderIndex, () {
      super.pageBuilderIndex = value;
    });
  }

  final _$getPharmacyAsyncAction =
      AsyncAction('_PharmacyViewModelBase.getPharmacy');

  @override
  Future<void> getPharmacy({int? limit = 0}) {
    return _$getPharmacyAsyncAction.run(() => super.getPharmacy(limit: limit));
  }

  final _$getProductsAsyncAction =
      AsyncAction('_PharmacyViewModelBase.getProducts');

  @override
  Future<void> getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  final _$changeTabBarItemAsyncAction =
      AsyncAction('_PharmacyViewModelBase.changeTabBarItem');

  @override
  Future<void> changeTabBarItem(int index) {
    return _$changeTabBarItemAsyncAction
        .run(() => super.changeTabBarItem(index));
  }

  final _$_PharmacyViewModelBaseActionController =
      ActionController(name: '_PharmacyViewModelBase');

  @override
  void changePageBuilderIndex(dynamic index) {
    final _$actionInfo = _$_PharmacyViewModelBaseActionController.startAction(
        name: '_PharmacyViewModelBase.changePageBuilderIndex');
    try {
      return super.changePageBuilderIndex(index);
    } finally {
      _$_PharmacyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pharmacy: ${pharmacy},
selectedItemIndex: ${selectedItemIndex},
products: ${products},
pageBuilderIndex: ${pageBuilderIndex}
    ''';
  }
}
