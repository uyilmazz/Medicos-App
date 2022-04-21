import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/container/animated_carousel.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../../../product/widgets/row/head_text_see_all.dart';
import '../model/product.dart';
import '../view_model/pharmacy_view_model.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;

  final PageController _pageController = PageController();
  final String _icon = 'shopping';

  @override
  Widget build(BuildContext context) {
    return BaseView<PharmacyViewModel>(
        viewModel: PharmacyViewModel(),
        onModelReady: (model) {},
        onPageBuilder: (context, viewModel) => Observer(
            builder: (context) => Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton:
                    CustomFabButton(text: LocaleKeys.addToCart.locale),
                body: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          Padding(
                            padding: context.appPadding,
                            child: Column(
                              children: [
                                _appBar(),
                                _imagePageBuilder(context, viewModel),
                                _carousel(context, viewModel),
                              ],
                            ),
                          ),
                          SizedBox(height: context.normalValue * 2),
                          Expanded(child: _productDetailContent(context))
                        ],
                      ),
                    ),
                  ],
                ))));
  }

  BackArrowAppBar _appBar() {
    return BackArrowAppBar(
        centerText: LocaleKeys.productDetail.locale, imageUrl: _icon.toIconPng);
  }

  SizedBox _imagePageBuilder(
      BuildContext context, PharmacyViewModel viewModel) {
    return SizedBox(
        height: context.height * 0.29,
        child: product.imageUrl != null
            ? PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (index) {
                  viewModel.changePageBuilderIndex(index);
                },
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.mediumValue * 2,
                          vertical: context.normalValue * 1.2),
                      child: Image.asset(product.imageUrl!.toImagePng,
                          fit: BoxFit.fill));
                })
            : const SizedBox());
  }

  SizedBox _carousel(BuildContext context, PharmacyViewModel viewModel) {
    return SizedBox(
      height: context.normalValue,
      child: Wrap(
          spacing: context.lowValue,
          alignment: WrapAlignment.center,
          children: List.generate(3, (index) {
            return GestureDetector(
                onTap: () {
                  _pageController.jumpToPage(index);
                  viewModel.changePageBuilderIndex(index);
                },
                child: AnimatedCarousel(
                    isActive:
                        viewModel.pageBuilderIndex == index ? true : false));
          })),
    );
  }

  Container _productDetailContent(BuildContext context) {
    return Container(
      padding: context.appPadding,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.mediumValue),
              topRight: Radius.circular(context.mediumValue))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.lowValue),
          Text(product.name ?? '',
              style: context.textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.w500)),
          Text('\$ ${(product.price ?? 0).toStringAsFixed(2)}',
              style: context.textTheme.subtitle1!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: context.theme.colorScheme.primary)),
          SizedBox(height: context.normalValue),
          CustomRatingBar(initializeRating: product.rate ?? 0),
          SizedBox(height: context.normalValue),
          const HeadAndSeeAllText(
              headText: LocaleKeys.description, isSeeAll: false),
          Text((product.description ?? ''),
              style: context.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 12)),
          SizedBox(height: context.normalValue),
          const HeadAndSeeAllText(
              headText: LocaleKeys.howToUse, isSeeAll: false),
          Text((product.usage ?? ''),
              style: context.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 12)),
          SizedBox(height: context.height * 0.08),
        ],
      ),
    );
  }
}
