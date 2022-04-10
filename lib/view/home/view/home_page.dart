import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../product/widgets/container/available_doctor_item.dart';
import '../../../product/widgets/container/department_item.dart';
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
            child: Observer(
                builder: (context) => SingleChildScrollView(
                      child: Column(
                        children: [
                          customAppbar(context),
                          const SearchBox(),
                          SizedBox(height: context.normalValue),
                          _headTextAndSeeAll(context, LocaleKeys.departments),
                          SizedBox(height: context.lowValue),
                          _scroolMedicineItem(context, homeViewModel,
                              homeViewModel.fakeDepartment),
                          SizedBox(height: context.normalValue),
                          _headTextAndSeeAll(context, LocaleKeys.pharmacy),
                          SizedBox(height: context.normalValue),
                          _scroolMedicineItem(context, homeViewModel,
                              homeViewModel.fakePharmacy),
                          SizedBox(height: context.mediumValue),
                          _headTextAndSeeAll(
                              context, LocaleKeys.availableDoctors),
                          SizedBox(height: context.normalValue),
                          _scroolDoctorItem(context, homeViewModel,
                              homeViewModel.fakeDepartment),
                          SizedBox(height: context.normalValue),
                        ],
                      ),
                    )),
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

  Row customAppbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.goodMorning.locale,
            style: context.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.primary)),
        CircleAvatar(backgroundImage: AssetImage('profile'.toImagePng))
      ],
    );
  }

  Row _headTextAndSeeAll(BuildContext context, String headText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headText.locale,
            style: context.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.w500)),
        Text(LocaleKeys.seeAll.locale,
            style: context.textTheme.subtitle1!.copyWith(
                color: context.theme.colorScheme.onSurface.withAlpha(122),
                fontWeight: FontWeight.w500)),
      ],
    );
  }

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
