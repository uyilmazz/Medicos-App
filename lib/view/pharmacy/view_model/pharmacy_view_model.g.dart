// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PharmacyViewModel on _PharmacyViewModelBase, Store {
  final _$fakePharmacyListAtom =
      Atom(name: '_PharmacyViewModelBase.fakePharmacyList');

  @override
  List<Pharmacy> get fakePharmacyList {
    _$fakePharmacyListAtom.reportRead();
    return super.fakePharmacyList;
  }

  @override
  set fakePharmacyList(List<Pharmacy> value) {
    _$fakePharmacyListAtom.reportWrite(value, super.fakePharmacyList, () {
      super.fakePharmacyList = value;
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

  final _$_PharmacyViewModelBaseActionController =
      ActionController(name: '_PharmacyViewModelBase');

  @override
  void changeTabBarItem(int index) {
    final _$actionInfo = _$_PharmacyViewModelBaseActionController.startAction(
        name: '_PharmacyViewModelBase.changeTabBarItem');
    try {
      return super.changeTabBarItem(index);
    } finally {
      _$_PharmacyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
fakePharmacyList: ${fakePharmacyList},
selectedItemIndex: ${selectedItemIndex},
products: ${products},
pageBuilderIndex: ${pageBuilderIndex}
    ''';
  }
}
