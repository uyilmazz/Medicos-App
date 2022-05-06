import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:medicos_app/core/base/view/base_widget.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';
import 'package:medicos_app/view/department/model/department.dart';
import 'package:medicos_app/view/department/view_model/department_view_model.dart';
import 'package:medicos_app/view/doctor/view/doctor_view.dart';
import 'package:medicos_app/view/doctor/view_model/doctor_view_model.dart';
import 'package:medicos_app/view/home/view_model/home_view_model.dart';
import 'package:medicos_app/view/pharmacy/view_model/pharmacy_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/container/available_doctor_item.dart';
import '../../../product/widgets/container/home_page_item.dart';
import '../../../product/widgets/row/head_text_see_all.dart';
import '../../../product/widgets/row/home_app.dart';
import '../../../product/widgets/stack/search_box.dart';
import '../../user/view_model/user_view_model.dart';

class HomeContent extends StatelessWidget {
  HomeContent({Key? key}) : super(key: key);

  final departmentViewModel = DepartmentViewModel();
  final doctorViewModel = DoctorViewModel();
  final pharmacViewModel = PharmacyViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.init();
          departmentViewModel.getDepartments(limit: 5);
          pharmacViewModel.getPharmacy(limit: 5);
          doctorViewModel.getDoctors(isAvailable: true);
        },
        onPageBuilder: (context, homeViewModel) => Observer(
            builder: (context) => SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeAppBar(
                          imageUrl: context
                              .watch<UserViewModel>()
                              .user
                              ?.imageUrl
                              ?.networkUrl),
                      const SearchBox(),
                      SizedBox(height: context.normalValue),
                      const HeadAndSeeAllText(headText: LocaleKeys.departments),
                      SizedBox(height: context.lowValue),
                      _scroolDepartmentItem(
                          context, departmentViewModel.departments),
                      SizedBox(height: context.normalValue),
                      const HeadAndSeeAllText(headText: LocaleKeys.pharmacy),
                      SizedBox(height: context.normalValue),
                      _scroolPharmacyItem(context, pharmacViewModel.pharmacy),
                      SizedBox(height: context.mediumValue),
                      const HeadAndSeeAllText(
                          headText: LocaleKeys.availableDoctors),
                      SizedBox(height: context.normalValue),
                      _scroolDoctorItem(
                          context, homeViewModel, doctorViewModel.doctors),
                      SizedBox(height: context.normalValue),
                    ],
                  ),
                )));
  }

  Widget _scroolDepartmentItem(BuildContext context, List<Department>? items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: context.lowValue,
          children: items == null
              ? [const SizedBox()]
              : items
                  .map((item) => InkWell(
                      child: HomePageItem(medicineItem: item),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DoctorView(department: item)));
                      }))
                  .toList()),
    );
  }

  Widget _scroolPharmacyItem(BuildContext context, List? items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: context.lowValue,
          children: items == null
              ? [const SizedBox()]
              : items.map((item) => HomePageItem(medicineItem: item)).toList()),
    );
  }

  Widget _scroolDoctorItem(BuildContext context, HomeViewModel homeViewModel,
          List? availableDoctorList) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
            alignment: WrapAlignment.start,
            spacing: context.lowValue,
            children: availableDoctorList == null
                ? [const SizedBox()]
                : availableDoctorList
                    .map((doctor) => AvailabeDoctorItem(doctor: doctor))
                    .toList()),
      );
}
