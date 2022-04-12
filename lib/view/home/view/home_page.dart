import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:medicos_app/product/widgets/row/head_text_see_all.dart';
import 'package:medicos_app/product/widgets/row/home_app.dart';
import 'package:medicos_app/view/department/view/department_view.dart';
import 'package:medicos_app/view/pharmacy/view/pharmacy_view.dart';
import '../../../product/widgets/container/available_doctor_item.dart';
import '../../../product/widgets/container/home_page_item.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/stack/search_box.dart';
import '../view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, homeViewModel) => Scaffold(
          bottomNavigationBar: _buildNavigationBar(context, homeViewModel),
          body: Padding(
            padding: context.appPadding,
            child: _setContent(context, homeViewModel),
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
                      homeViewModel.changeBottomNavigationIten(index);
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

  Widget _setContent(BuildContext context, HomeViewModel homeViewModel) =>
      Observer(builder: (context) {
        return homeViewModel.bottomNavigationBarIndex == 0
            ? _homeContent(context, homeViewModel)
            : homeViewModel.bottomNavigationBarIndex == 1
                ? DepartmentPage(department: homeViewModel.getAllDepartments)
                : homeViewModel.bottomNavigationBarIndex == 2
                    ? const PharmacyView()
                    : const SizedBox();
      });

  Widget _homeContent(BuildContext context, HomeViewModel homeViewModel) =>
      SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(imageUrl: 'profile'.toImagePng),
            const SearchBox(),
            SizedBox(height: context.normalValue),
            const HeadAndSeeAllText(headText: LocaleKeys.departments),
            SizedBox(height: context.lowValue),
            _scroolMedicineItem(
                context, homeViewModel, homeViewModel.fakeDepartment),
            SizedBox(height: context.normalValue),
            const HeadAndSeeAllText(headText: LocaleKeys.pharmacy),
            SizedBox(height: context.normalValue),
            _scroolMedicineItem(
                context, homeViewModel, homeViewModel.fakePharmacy),
            SizedBox(height: context.mediumValue),
            const HeadAndSeeAllText(headText: LocaleKeys.availableDoctors),
            SizedBox(height: context.normalValue),
            _scroolDoctorItem(
                context, homeViewModel, homeViewModel.fakeDepartment),
            SizedBox(height: context.normalValue),
          ],
        ),
      );

  Widget _scroolMedicineItem(
          BuildContext context, HomeViewModel homeViewModel, List? items) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
            alignment: WrapAlignment.start,
            spacing: context.lowValue,
            children: items == null
                ? [const SizedBox()]
                : items
                    .map((department) => HomePageItem(medicineItem: department))
                    .toList()),
      );

  Widget _scroolDoctorItem(
          BuildContext context, HomeViewModel homeViewModel, List? items) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
            alignment: WrapAlignment.start,
            spacing: context.lowValue,
            children: items == null
                ? [const SizedBox()]
                : items.map((department) => AvailabeDoctorItem()).toList()),
      );
}
