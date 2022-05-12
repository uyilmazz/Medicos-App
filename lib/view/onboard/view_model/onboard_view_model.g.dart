// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardViewModel on _OnboardViewModelBase, Store {
  final _$onboardListAtom = Atom(name: '_OnboardViewModelBase.onboardList');

  @override
  List<OnBoard>? get onboardList {
    _$onboardListAtom.reportRead();
    return super.onboardList;
  }

  @override
  set onboardList(List<OnBoard>? value) {
    _$onboardListAtom.reportWrite(value, super.onboardList, () {
      super.onboardList = value;
    });
  }

  final _$isFirstInstallAtom =
      Atom(name: '_OnboardViewModelBase.isFirstInstall');

  @override
  bool get isFirstInstall {
    _$isFirstInstallAtom.reportRead();
    return super.isFirstInstall;
  }

  @override
  set isFirstInstall(bool value) {
    _$isFirstInstallAtom.reportWrite(value, super.isFirstInstall, () {
      super.isFirstInstall = value;
    });
  }

  final _$pageViewItemIndexAtom =
      Atom(name: '_OnboardViewModelBase.pageViewItemIndex');

  @override
  int get pageViewItemIndex {
    _$pageViewItemIndexAtom.reportRead();
    return super.pageViewItemIndex;
  }

  @override
  set pageViewItemIndex(int value) {
    _$pageViewItemIndexAtom.reportWrite(value, super.pageViewItemIndex, () {
      super.pageViewItemIndex = value;
    });
  }

  final _$isFirstInstallUpdateAsyncAction =
      AsyncAction('_OnboardViewModelBase.isFirstInstallUpdate');

  @override
  Future<void> isFirstInstallUpdate() {
    return _$isFirstInstallUpdateAsyncAction
        .run(() => super.isFirstInstallUpdate());
  }

  final _$_OnboardViewModelBaseActionController =
      ActionController(name: '_OnboardViewModelBase');

  @override
  void changePageViewItemIndex(int value) {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.changePageViewItemIndex');
    try {
      return super.changePageViewItemIndex(value);
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isFirtInstallControl() {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.isFirtInstallControl');
    try {
      return super.isFirtInstallControl();
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onboardList: ${onboardList},
isFirstInstall: ${isFirstInstall},
pageViewItemIndex: ${pageViewItemIndex}
    ''';
  }
}
