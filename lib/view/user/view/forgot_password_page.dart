import 'package:flutter/material.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/text/auth_head_text.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/column/form_item.dart';
import '../../../product/widgets/textField/password_text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  bool _newPasswordObcure = true;
  bool _confirmPasswordObcure = true;

  @override
  void initState() {
    super.initState();
    _confirmPasswordController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: context.lowValue),
                _forgotPasswordImage,
                SizedBox(height: context.mediumValue * 1.2),
                AuthHeadText(text: LocaleKeys.forgot_forgotPassword.locale),
                Text(LocaleKeys.forgot_createNewPasssword.locale,
                    style: context.textTheme.subtitle1!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
                SizedBox(height: context.height * 0.08),
                _passwordFormItem,
                _confirmPassword,
                CustomFabButton(text: LocaleKeys.login_reset.locale),
              ],
            ),
          )),
    );
  }

  Widget get _forgotPasswordImage => Align(
      alignment: Alignment.center,
      child: Image.asset(ImageConstants.instance.forgotImage.toImagePng,
          height: context.height * 0.32, fit: BoxFit.cover));

  FormItem get _passwordFormItem => FormItem(
      headText: LocaleKeys.profile_newPassword.locale,
      textformField: PasswordTextFormField(
          suffixOnPressed: () {
            setState(() {
              _newPasswordObcure = !_newPasswordObcure;
            });
          },
          obcure: _newPasswordObcure,
          controller: _passwordController,
          context: context),
      bottomSpace: context.normalValue);

  FormItem get _confirmPassword => FormItem(
      headText: LocaleKeys.profile_confirmPassword.locale,
      textformField: PasswordTextFormField(
          suffixOnPressed: () {
            setState(() {
              _confirmPasswordObcure = !_confirmPasswordObcure;
            });
          },
          obcure: _confirmPasswordObcure,
          controller: _confirmPasswordController,
          context: context),
      bottomSpace: context.height * 0.06);
}
