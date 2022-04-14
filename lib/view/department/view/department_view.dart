import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/container/home_page_item.dart';
import '../../../product/widgets/row/head_text_see_all.dart';
import '../../../product/widgets/row/home_app.dart';
import '../../../product/widgets/stack/search_box.dart';
import '../model/department.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({Key? key, required this.department}) : super(key: key);

  final List<Department>? department;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppBar(imageUrl: 'profile'.toImagePng),
          const SearchBox(),
          SizedBox(height: context.normalValue),
          const HeadAndSeeAllText(
              headText: LocaleKeys.departments, isSeeAll: false),
          department != null
              ? GridView.builder(
                  padding: EdgeInsets.only(top: context.normalValue),
                  shrinkWrap: true,
                  itemCount: department!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: context.lowValue * 1.5,
                      mainAxisSpacing: context.normalValue,
                      childAspectRatio: (context.width / context.height * 1.5),
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return HomePageItem(medicineItem: department![index]);
                  })
              : const SizedBox(),
          SizedBox(height: context.normalValue),
        ],
      ),
    );
  }
}
