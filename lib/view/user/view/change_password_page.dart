import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/column/form_item.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../../../product/widgets/textField/password_text_form_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late GlobalKey _formKey;

  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  bool _oldPasswordObsure = true;
  bool _newPasswordObsure = true;
  bool _confirmPasswordObsure = true;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();

    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: context.appPadding,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  BackArrowAppBar(
                      centerText: LocaleKeys.profile_changePassword.locale),
                  SizedBox(height: context.mediumValue * 2),
                  _oldPasswordFormItem(context),
                  _newPasswordFormItem(context),
                  _confirmPassswordFormItem(context),
                  SizedBox(height: context.height * 0.05),
                  CustomFabButton(text: LocaleKeys.profile_done.locale)
                ],
              ),
            )));
  }

  FormItem _oldPasswordFormItem(BuildContext context) {
    return FormItem(
      headText: LocaleKeys.profile_oldPassword.locale,
      bottomSpace: context.normalValue,
      textformField: PasswordTextFormField(
          controller: _oldPasswordController,
          suffixOnPressed: () {
            setState(() {
              _oldPasswordObsure = !_oldPasswordObsure;
            });
          },
          obsure: _oldPasswordObsure,
          maxLine: 1,
          validateFunc: (value) {}),
    );
  }

  FormItem _newPasswordFormItem(BuildContext context) {
    return FormItem(
      headText: LocaleKeys.profile_newPassword.locale,
      bottomSpace: context.normalValue,
      textformField: PasswordTextFormField(
          controller: _newPasswordController,
          suffixOnPressed: () {
            setState(() {
              _newPasswordObsure = !_newPasswordObsure;
            });
          },
          obsure: _newPasswordObsure,
          maxLine: 1,
          validateFunc: (value) {}),
    );
  }

  FormItem _confirmPassswordFormItem(BuildContext context) {
    return FormItem(
      headText: LocaleKeys.profile_confirmPassword.locale,
      bottomSpace: context.normalValue,
      textformField: PasswordTextFormField(
          controller: _confirmPasswordController,
          suffixOnPressed: () {
            setState(() {
              _confirmPasswordObsure = !_confirmPasswordObsure;
            });
          },
          obsure: _confirmPasswordObsure,
          maxLine: 1,
          validateFunc: (value) {}),
    );
  }
}
