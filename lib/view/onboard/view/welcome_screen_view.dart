import 'package:flutter/material.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import 'onboard_screen_view.dart';

class WelcomeScreenView extends StatelessWidget {
  const WelcomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: context.height * 0.17),
          Text(LocaleKeys.welcomeScreen_welcomeTo.locale,
              style: context.textTheme.headline5?.copyWith(
                  fontSize: 30,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: context.theme.colorScheme.primary)),
          Text(AppConstants.APP_NAME,
              style: context.textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 45,
                  color: context.theme.colorScheme.primary)),
          SizedBox(height: context.normalValue * 1.5),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
              child: Text(LocaleKeys.welcomeScreen_welcomeDesc.locale,
                  textAlign: TextAlign.center,
                  style: context.textTheme.subtitle1!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w400))),
          SizedBox(height: context.height * 0.04),
          Image.asset(ImageConstants.instance.welcomeScreen.toImagePng,
              height: context.height * 0.3, fit: BoxFit.cover),
          SizedBox(height: context.height * 0.15),
          CustomFabButton(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => OnBoardScreen()),
                    (route) => false);
              },
              text: LocaleKeys.welcomeScreen_getStarted.locale)
        ],
      ),
    );
  }
}
