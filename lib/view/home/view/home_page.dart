import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:medicos_app/view/department/view_model/department_view_model.dart';
import 'package:medicos_app/view/home/view/home_content.dart';
import '../../doctor/view_model/doctor_view_model.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../department/view/department_view.dart';
import '../../pharmacy/view/pharmacy_view.dart';
import '../view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _doctorViewModel = DoctorViewModel();
  final _departmentViewModel = DepartmentViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        _doctorViewModel.init();
        model.init();
      },
      onPageBuilder: (context, homeViewModel) => Scaffold(
          bottomNavigationBar: _buildNavigationBar(context, homeViewModel),
          body: Padding(
            padding: context.appPadding,
            child: _setContent(context, homeViewModel, _departmentViewModel),
          )),
    );
  }

  Widget _buildNavigationBar(
          BuildContext context, HomeViewModel homeViewModel) =>
      Observer(
          builder: (context) => ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.mediumValue),
                    topRight: Radius.circular(context.mediumValue)),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: context.theme.colorScheme.onSurface,
                        blurRadius: 10)
                  ]),
                  height: context.height * 0.09,
                  child: BottomNavigationBar(
                    backgroundColor: context.theme.colorScheme.onSecondary,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedFontSize: 0,
                    onTap: (index) {
                      if (index == 3) {
                        _showBottomSheet(context);
                      }
                      homeViewModel.changeBottomNavigationItem(index);
                    },
                    currentIndex: homeViewModel.bottomNavigationBarIndex,
                    items: [
                      _bottomNavBarItem(homeViewModel, context, 'Home', 0),
                      _bottomNavBarItem(homeViewModel, context, 'doctors', 1),
                      _bottomNavBarItem(homeViewModel, context, 'Medicine', 2),
                      _bottomNavBarItem(homeViewModel, context, 'Menu', 3),
                    ],
                  ),
                ),
              ));

  Future<dynamic> _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        useRootNavigator: true,
        context: context,
        builder: (context) => Container(color: Colors.red));
  }

  BottomNavigationBarItem _bottomNavBarItem(HomeViewModel homeViewModel,
      BuildContext context, String name, int index) {
    return BottomNavigationBarItem(
        icon: Image.asset(name.toIconPng,
            color: homeViewModel.bottomNavigationBarIndex == index
                ? context.theme.colorScheme.onPrimary
                : context.theme.colorScheme.onError,
            height: context.height * 0.04),
        label: '');
  }

  Widget _setContent(BuildContext context, HomeViewModel homeViewModel,
          DepartmentViewModel departmentViewModel) =>
      Observer(builder: (context) {
        return homeViewModel.bottomNavigationBarIndex == 0
            // ? _homeContent(context, homeViewModel, departmentViewModel)
            ? HomeContent()
            : homeViewModel.bottomNavigationBarIndex == 1
                ? DepartmentPage(department: homeViewModel.getAllDepartments)
                : homeViewModel.bottomNavigationBarIndex == 2
                    ? const PharmacyView()
                    : const SizedBox();
      });
}
