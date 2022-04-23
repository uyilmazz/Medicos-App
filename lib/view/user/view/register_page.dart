import 'package:flutter/material.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/text/auth_head_text.dart';
import '../../../core/widgets/text/auth_rich_text.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/column/form_item.dart';
import '../../../product/widgets/textField/password_text_form_field.dart';
import '../../../product/widgets/textField/user_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: context.appPadding +
              EdgeInsets.symmetric(horizontal: context.lowValue),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _registerImage,
                SizedBox(height: context.normalValue),
                AuthHeadText(text: LocaleKeys.login_createAccount.locale),
                SizedBox(height: context.normalValue),
                _nameFormItem,
                _emailFormItem,
                _phoneNumberFormItem,
                _passwordFormItem,
                SizedBox(height: context.normalValue * 1.5),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomFabButton(text: LocaleKeys.login_signUp.locale),
                      SizedBox(height: context.lowValue),
                      AuthRichText(
                          textOne: LocaleKeys.login_alreadyHaveAnAccout.locale,
                          textTwo: LocaleKeys.login_signIn.locale),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget get _registerImage => Align(
        alignment: Alignment.center,
        child: Image.asset(ImageConstants.instance.registerImage.toImagePng,
            height: context.height * 0.22, fit: BoxFit.cover),
      );

  FormItem get _nameFormItem => FormItem(
      headText: LocaleKeys.profile_name.locale,
      textformField: UserTextFormField(controller: _nameController),
      bottomSpace: context.lowValue);

  FormItem get _emailFormItem => FormItem(
      headText: LocaleKeys.profile_email.locale,
      textformField: UserTextFormField(controller: _emailController),
      bottomSpace: context.lowValue);

  FormItem get _phoneNumberFormItem => FormItem(
      headText: LocaleKeys.profile_phoneNumber.locale,
      textformField: UserTextFormField(controller: _phoneNumberController),
      bottomSpace: context.lowValue);

  FormItem get _passwordFormItem => FormItem(
      headText: LocaleKeys.login_password.locale,
      textformField: PasswordTextFormField(
          controller: _passwordController, context: context),
      bottomSpace: context.lowValue);
}
