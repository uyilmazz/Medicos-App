import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../../../product/widgets/textField/read_only_text_form_field.dart';
import 'change_password_page.dart';
import 'edit_profile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  final String _userProfileImage = 'user_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: context.appPadding,
        child: Column(
          children: [
            const BackArrowAppBar(centerText: 'Profile'),
            SizedBox(height: context.mediumValue),
            CircleAvatar(
                radius: context.height * 0.1,
                backgroundImage: AssetImage(_userProfileImage.toImagePng)),
            SizedBox(height: context.normalValue),
            _formItem(context, LocaleKeys.profile_name, 'Wade Warren'),
            _formItem(context, LocaleKeys.profile_email, 'adc@gmail.com'),
            _formItem(
                context, LocaleKeys.profile_phoneNumber, '(603) 555-0123'),
            SizedBox(height: context.normalValue),
            CustomFabButton(
                text: LocaleKeys.profile_editProfile.locale,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfile()));
                }),
            SizedBox(height: context.normalValue * 1.5),
            _changeButton(context, () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage()));
            }, LocaleKeys.profile_changePassword.locale)
          ],
        ),
      ),
    );
  }

  Column _formItem(BuildContext context, String headText, String? initText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headText.locale,
            style: context.textTheme.headline6!
                .copyWith(letterSpacing: -0.5, fontWeight: FontWeight.w600)),
        SizedBox(height: context.lowValue),
        ReadOnlyTextFormField(maxLine: 2, initText: initText),
        SizedBox(height: context.normalValue * 1.5),
      ],
    );
  }

  Widget _changeButton(
          BuildContext context, void Function()? onTap, String text) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
            width: context.width * 0.6,
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.08,
                vertical: context.lowValue * 1.3),
            decoration: BoxDecoration(
                border: Border.all(color: context.theme.colorScheme.primary),
                color: context.theme.colorScheme.onSecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(context.lowValue * 1.7)),
            child: Text(text,
                textAlign: TextAlign.center,
                style: context.textTheme.headline2!.copyWith(
                    fontSize: 18,
                    color: context.theme.colorScheme.primary,
                    fontWeight: FontWeight.w600))),
      );
}
