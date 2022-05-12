import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/view_model/base_view_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase extends BaseViewModel with Store {
  @observable
  int bottomNavigationBarIndex = 0;

  int beforeBottomNavigationBarIndex = 0;

  List<String> bottomNavigationItems = ['Home', 'doctors', 'Medicine', 'Menu'];

  @observable
  bool isOpenSetting = false;

  @action
  void changeOpenSettingState(bool value) {
    isOpenSetting = value;
  }

  @override
  void init() {}

  @action
  void changeBottomNavigationItem(int index) {
    beforeBottomNavigationBarIndex = bottomNavigationBarIndex;
    bottomNavigationBarIndex = index;
  }

  @action
  void showBottomSheetClose() {
    bottomNavigationBarIndex = beforeBottomNavigationBarIndex;
  }
}
