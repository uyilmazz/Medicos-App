import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/container/home_page_item.dart';
import '../../../product/widgets/container/product_item.dart';
import '../../../product/widgets/row/head_text_see_all.dart';
import '../../../product/widgets/row/home_app.dart';
import '../../../product/widgets/textField/search_text_field.dart';
import '../../home/model/medicine_model.dart';
import '../../user/view_model/user_view_model.dart';
import '../view_model/pharmacy_view_model.dart';

class PharmacyView extends StatelessWidget {
  const PharmacyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PharmacyViewModel>(
        viewModel: PharmacyViewModel(),
        onModelReady: (model) {
          model.init();
        },
        onPageBuilder: (context, viewModel) => Observer(
            builder: (context) => DefaultTabController(
                  length: viewModel.pharmacy != null
                      ? viewModel.pharmacy!.length
                      : 0,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeAppBar(isShop: true),
                        Text(context.watch<UserViewModel>().fakeUser.name ?? '',
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
              child: viewModel.pharmacy != null
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          viewModel.pharmacy!.length,
                          (index) => _tabBarItem(context,
                              viewModel.pharmacy![index], viewModel, index)))
                  : const SizedBox()));

  Padding _tabBarItem(BuildContext context, MedicineModel currentModel,
      PharmacyViewModel viewModel, int itemIndex) {
    return Padding(
      padding: EdgeInsets.only(right: context.lowValue),
      child: GestureDetector(
          onTap: () async {
            await viewModel.changeTabBarItem(itemIndex);
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
