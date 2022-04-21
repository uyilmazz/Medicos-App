import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/view_model/base_view_model.dart';
import '../../department/model/department.dart';
import '../../pharmacy/model/pharmacy.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase extends BaseViewModel with Store {
  late BuildContext context;

  @observable
  List<Department>? fakeDepartment;

  @observable
  int bottomNavigationBarIndex = 0;

  List<String> bottomNavigationItems = ['Home', 'doctors', 'Medicine', 'Menu'];

  @observable
  List<Pharmacy>? fakePharmacy;

  @observable
  List<Department>? getAllDepartments;

  @observable
  bool isOpenSetting = false;

  @action
  void changeOpenSettingState(bool value) {
    isOpenSetting = value;
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    fakeDepartment = Department.getListFakeDepartment();
    fakePharmacy = Pharmacy.getFakePharmacyList();
    getAllDepartments = Department.getAllFakeDepartments();
  }

  @action
  void changeBottomNavigationItem(int index) {
    bottomNavigationBarIndex = index;
  }
}
