import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:medicos_app/core/base/view/base_widget.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';
import 'package:medicos_app/product/widgets/row/back_arrow_app_bar.dart';
import 'package:medicos_app/product/widgets/row/home_app.dart';
import 'package:medicos_app/product/widgets/textField/search_text_field.dart';
import 'package:medicos_app/view/home/model/medicine_model.dart';
import 'package:medicos_app/view/pharmacy/view_model/pharmacy_view_model.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/container/home_page_item.dart';
import '../../../product/widgets/container/product_item.dart';
import '../../../product/widgets/row/head_text_see_all.dart';

class PharmacyView extends StatelessWidget {
  const PharmacyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PharmacyViewModel>(
        viewModel: PharmacyViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewModel) => Observer(
            builder: (context) => DefaultTabController(
                  length: viewModel.fakePharmacyList.length,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeAppBar(
                            imageUrl: 'profile'.toImagePng, isShop: true),
                        Text('Dev user',
                            style: context.textTheme.subtitle1!.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        SizedBox(height: context.normalValue * 1.5),
                        SizedBox(
                            height: context.height * 0.05,
                            child: SearchTextField(
                                customFillColor:
                                    context.theme.colorScheme.onSecondary)),
                        SizedBox(height: context.normalValue),
                        const HeadAndSeeAllText(
                            headText: LocaleKeys.categories, isSeeAll: false),
                        SizedBox(height: context.normalValue),
                        _customTabBar(context, viewModel),
                        SizedBox(height: context.normalValue * 1.5),
                        const HeadAndSeeAllText(
                            headText: LocaleKeys.products, isSeeAll: false),
                        viewModel.products != null
                            ? _productGridView(context, viewModel)
                            : const SizedBox(),
                        SizedBox(height: context.normalValue),
                      ],
                    ),
                  ),
                )));
  }

  Widget _customTabBar(BuildContext context, PharmacyViewModel viewModel) =>
      Observer(
          builder: (context) => SizedBox(
              height: context.height * 0.16,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      viewModel.fakePharmacyList.length,
                      (index) => _tabBarItem(
                          context,
                          viewModel.fakePharmacyList[index],
                          viewModel,
                          index)))));

  Padding _tabBarItem(BuildContext context, MedicineModel currentModel,
      PharmacyViewModel viewModel, int itemIndex) {
    return Padding(
      padding: EdgeInsets.only(right: context.lowValue),
      child: GestureDetector(
          onTap: () {
            viewModel.changeTabBarItem(itemIndex);
          },
          child: HomePageItem(
              medicineItem: currentModel,
              isSelected:
                  viewModel.selectedItemIndex == itemIndex ? true : false)),
    );
  }

  GridView _productGridView(BuildContext context, PharmacyViewModel viewModel) {
    return GridView.builder(
        padding: EdgeInsets.only(top: context.normalValue),
        shrinkWrap: true,
        itemCount: viewModel.products!.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: context.normalValue,
            mainAxisSpacing: context.normalValue,
            childAspectRatio: (context.width / context.height * 2),
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ProductItem(item: viewModel.products![index]);
        });
  }
}
