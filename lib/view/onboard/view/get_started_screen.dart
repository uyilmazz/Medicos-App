import 'package:flutter/material.dart';
import 'package:medicos_app/core/base/view/base_widget.dart';
import 'package:medicos_app/view/onboard/view_model/onboard_view_model.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_gradient_button.dart';
import '../../user/view/login_page.dart';
import '../../user/view/register_page.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
        viewModel: OnboardViewModel(),
        onModelReady: (model) {},
        onPageBuilder: (context, viewModel) => Scaffold(
              body: Column(
                children: [
                  Expanded(flex: 25, child: _imageAndGetStartedText(context)),
                  Expanded(
                      flex: 12,
                      child: _signInAndSignUpButton(context, viewModel)),
                ],
              ),
            ));
  }

  Column _imageAndGetStartedText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(ImageConstants.instance.getStartedScreen.toImagePng,
            height: context.height * 0.32, fit: BoxFit.cover),
        Text(LocaleKeys.welcomeScreen_getStarted.locale + '...!',
            style: context.textTheme.headline4?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 45,
                color: context.theme.colorScheme.primary))
      ],
    );
  }

  Container _signInAndSignUpButton(
      BuildContext context, OnboardViewModel viewModel) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: context.theme.colorScheme.onSecondary,
          boxShadow: [
            BoxShadow(color: context.theme.colorScheme.surface, blurRadius: 1)
          ],
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(context.mediumValue))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientButton(
              onTap: () async {
                await viewModel.isFirstInstallUpdate();

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginView()),
                    (route) => false);
              },
              buttonText: LocaleKeys.login_signIn.locale,
              width: context.width * 0.65),
          SizedBox(height: context.height * 0.035),
          GradientButton(
              onTap: () async {
                await viewModel.isFirstInstallUpdate();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const RegisterView()),
                    (route) => false);
              },
              buttonText: LocaleKeys.login_signUp.locale,
              width: context.width * 0.65,
              isSelected: false),
        ],
      ),
    );
  }
}
