import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../department/view_model/department_view_model.dart';
import 'home_content.dart';
import '../../user/view/login_page.dart';
import '../../user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../doctor/view_model/doctor_view_model.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../department/view/department_view.dart';
import '../../pharmacy/view/pharmacy_view.dart';
import '../../user/view/user_appointment.dart';
import '../../user/view/user_profile.dart';
import '../view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _doctorViewModel = DoctorViewModel();
  final _departmentViewModel = DepartmentViewModel();

  List<Widget> pages = [
    HomeContent(),
    const DepartmentPage(),
    const PharmacyView()
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        _doctorViewModel.init();
        model.init();
      },
      onPageBuilder: (context, homeViewModel) => Observer(
          builder: (context) => Scaffold(
              bottomNavigationBar: _buildNavigationBar(context, homeViewModel),
              body: SizedBox(
                height: context.height,
                child: Stack(
                  children: [
                    Padding(
                        padding: context.appPadding,
                        child: _setContent(
                            context, homeViewModel, _departmentViewModel)),
                    homeViewModel.bottomNavigationBarIndex == 3
                        ? _showBottomMenu(context, homeViewModel)
                        : const SizedBox()
                  ],
                ),
              ))),
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
                      homeViewModel.changeBottomNavigationItem(index);
                    },
                    currentIndex: homeViewModel.bottomNavigationBarIndex,
                    items: [
                      _bottomNavBarItem(homeViewModel, context,
                          ImageConstants.instance.bottomNavigationHome, 0),
                      _bottomNavBarItem(homeViewModel, context,
                          ImageConstants.instance.bottomNavigationDoctors, 1),
                      _bottomNavBarItem(homeViewModel, context,
                          ImageConstants.instance.bottomNavigationMedicine, 2),
                      _bottomNavBarItem(homeViewModel, context,
                          ImageConstants.instance.bottomNavigationMEnu, 3),
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

  Widget _setContent(BuildContext context, HomeViewModel homeViewModel,
          DepartmentViewModel departmentViewModel) =>
      Observer(builder: (context) {
        return pages[homeViewModel.bottomNavigationBarIndex != 3
            ? homeViewModel.bottomNavigationBarIndex
            : homeViewModel.beforeBottomNavigationBarIndex];
      });

  Widget _showBottomMenu(BuildContext context, HomeViewModel viewModel) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              viewModel.showBottomSheetClose();
            },
            child: Container(
                height: context.height,
                width: context.width,
                color: Colors.grey.withOpacity(0.4)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: context.height * 0.3,
              width: context.width,
              padding: EdgeInsets.only(
                  top: context.mediumValue, left: context.normalValue),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.mediumValue),
                    topRight: Radius.circular(context.mediumValue),
                    bottomLeft: Radius.circular(context.normalValue),
                    bottomRight: Radius.circular(context.normalValue)),
                gradient: LinearGradient(colors: [
                  context.theme.colorScheme.primary,
                  context.theme.colorScheme.primary.withOpacity(0.3)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: _showBottomMenuColums(context),
            ),
          ),
        ],
      ),
    );
  }

  Column _showBottomMenuColums(BuildContext context) {
    return Column(
      children: [
        _shotBottomMenuItem(
            context,
            ImageConstants.instance.showBottomMenuProfile,
            LocaleKeys.profile_profile.locale, () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const UserProfile()));
        }),
        _shotBottomMenuItem(
            context,
            ImageConstants.instance.showBottomMenuAppointment,
            LocaleKeys.userAppointment_myAppointments.locale, () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const UserAppointment()));
        }),
        _shotBottomMenuItem(
            context,
            ImageConstants.instance.showBottomMenuLogout,
            LocaleKeys.logout.locale, () {
          context.read<UserViewModel>().logout();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginView()),
              (route) => false);
        }),
      ],
    );
  }

  ListTile _shotBottomMenuItem(
      BuildContext context, String iconText, String text, Function()? onTap) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(iconText.toIconPng),
      title: Text(text,
          style: context.textTheme.subtitle1!.copyWith(
              color: context.theme.colorScheme.onSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 23)),
    );
  }
}
