import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../model/onboard_model.dart';
import 'get_started_screen.dart';
import '../view_model/onboard_view_model.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
        viewModel: OnboardViewModel(),
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onPageBuilder: (context, viewModel) => Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: context.height * 0.12),
                    Expanded(flex: 12, child: _pageViewbuilder(viewModel)),
                    Expanded(
                        flex: 7,
                        child: _carouselAndNextbutton(context, viewModel))
                  ],
                ),
              ),
            ));
  }

  Widget _pageViewbuilder(OnboardViewModel viewModel) {
    return viewModel.onboardList != null
        ? PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              viewModel.changePageViewItemIndex(index);
            },
            itemCount: viewModel.onboardList!.length,
            itemBuilder: (context, index) {
              OnBoard currentItem = viewModel.onboardList![index];
              return _pageViewItem(currentItem, context);
            })
        : const SizedBox();
  }

  Column _pageViewItem(OnBoard currentItem, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(currentItem.imageUrl.toImagePng,
            height: context.height * 0.32),
        const Spacer(),
        Text(currentItem.description,
            textAlign: TextAlign.center,
            style: context.textTheme.headline5?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.primary)),
        SizedBox(height: context.lowValue)
      ],
    );
  }

  Widget _carouselAndNextbutton(
      BuildContext context, OnboardViewModel viewModel) {
    return Observer(
        builder: (context) => Container(
              padding: EdgeInsets.only(top: context.normalValue),
              child: Column(
                children: [
                  Text(LocaleKeys.startedSlider_sliderDesc.locale,
                      textAlign: TextAlign.center,
                      style: context.textTheme.subtitle1!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
                  SizedBox(height: context.height * 0.07),
                  _nextButton(viewModel, context),
                  const Spacer(),
                  viewModel.onboardList != null
                      ? _carousel(context, viewModel)
                      : const SizedBox(),
                  SizedBox(height: context.mediumValue)
                ],
              ),
            ));
  }

  CustomFabButton _nextButton(
      OnboardViewModel viewModel, BuildContext context) {
    return CustomFabButton(
        text: LocaleKeys.startedSlider_next.locale,
        onTap: () {
          if (viewModel.onboardList != null) {
            if (viewModel.pageViewItemIndex <
                viewModel.onboardList!.length - 1) {
              _pageController.jumpToPage(viewModel.pageViewItemIndex + 1);
            } else {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const GetStartedScreen()),
                  (route) => false);
            }
          }
        });
  }

  Wrap _carousel(BuildContext context, OnboardViewModel viewModel) {
    return Wrap(
      spacing: context.lowValue,
      alignment: WrapAlignment.center,
      children: List.generate(
          viewModel.onboardList!.length,
          (index) => Container(
                height: context.height * 0.01,
                width: context.width * 0.19,
                decoration: BoxDecoration(
                    color: viewModel.pageViewItemIndex == index
                        ? context.theme.colorScheme.tertiary
                        : context.theme.colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(context.lowValue)),
              )),
    );
  }
}
