import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/view/base_widget.dart';
import '../view_model/department_view_model.dart';
import '../../doctor/view/doctor_view.dart';
import 'package:provider/provider.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/container/home_page_item.dart';
import '../../../product/widgets/row/head_text_see_all.dart';
import '../../../product/widgets/row/home_app.dart';
import '../../../product/widgets/stack/search_box.dart';
import '../../user/view_model/user_view_model.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DepartmentViewModel>(
        viewModel: DepartmentViewModel(),
        onModelReady: (model) {
          model.init();
        },
        onPageBuilder: (context, viewModel) => Observer(
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
                      const HeadAndSeeAllText(
                          headText: LocaleKeys.departments, isSeeAll: false),
                      viewModel.departments != null
                          ? _gridViewBuilder(context, viewModel)
                          : const SizedBox(),
                      SizedBox(height: context.normalValue),
                    ],
                  ),
                )));
  }

  GridView _gridViewBuilder(
      BuildContext context, DepartmentViewModel viewModel) {
    return GridView.builder(
        padding: EdgeInsets.only(top: context.normalValue),
        shrinkWrap: true,
        itemCount: viewModel.departments!.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: context.lowValue * 1.5,
            mainAxisSpacing: context.normalValue,
            childAspectRatio: (context.width / context.height * 1.5),
            crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DoctorView(department: viewModel.departments![index])));
            },
            child: HomePageItem(medicineItem: viewModel.departments![index]),
          );
        });
  }
}
