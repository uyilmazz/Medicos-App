import 'package:flutter/material.dart';
import 'package:medicos_app/view/user/view/forgot_password_page.dart';
import '../../home/view/home_page.dart';
import 'register_page.dart';
import '../view_model/user_view_model.dart';
import 'package:provider/provider.dart';
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

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: context.appPadding,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _loginImage,
                SizedBox(height: context.normalValue),
                AuthHeadText(text: LocaleKeys.login_welcomeBack.locale),
                SizedBox(height: context.normalValue),
                _emailFormItem,
                _passwordFormItem,
                SizedBox(height: context.normalValue * 1.5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomFabButton(
                        text: LocaleKeys.login_logIn.locale,
                        onTap: () async {
                          final response = await context
                              .read<UserViewModel>()
                              .userLogin(_emailController.text,
                                  _passwordController.text);

                          if (response) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          }
                        }),
                    SizedBox(height: context.lowValue),
                    AuthRichText(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordPage()));
                        },
                        textOne: LocaleKeys.login_forgotPassword.locale,
                        textTwo: LocaleKeys.login_reset.locale),
                    SizedBox(height: context.lowValue),
                    AuthRichText(
                        textOne: LocaleKeys.login_dontHaveAnAccount.locale,
                        textTwo: LocaleKeys.login_createAccount.locale,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                        }),
                    SizedBox(height: context.mediumValue),
                    _orLoginWith,
                    SizedBox(height: context.normalValue * 1.6),
                    _facebookAndGoogleIcon
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget get _loginImage => Align(
        alignment: Alignment.center,
        child: Image.asset(ImageConstants.instance.loginImage.toImagePng,
            height: context.height * 0.28, fit: BoxFit.cover),
      );

  FormItem get _emailFormItem => FormItem(
      headText: LocaleKeys.profile_email.locale,
      textformField: UserTextFormField(controller: _emailController),
      bottomSpace: context.lowValue);

  FormItem get _passwordFormItem => FormItem(
      headText: LocaleKeys.login_password.locale,
      textformField: PasswordTextFormField(
          controller: _passwordController, context: context),
      bottomSpace: context.lowValue);

  Row get _orLoginWith => Row(
        children: [
          Expanded(child: _divider(context, 0, 10)),
          Text(
            LocaleKeys.login_orLoginWith.locale,
            style: context.textTheme.subtitle1?.copyWith(
                fontSize: 17,
                color: context.theme.colorScheme.onSurface.withOpacity(0.4),
                fontWeight: FontWeight.w700),
          ),
          Expanded(child: _divider(context, 10, 0))
        ],
      );

  Divider _divider(BuildContext context, double indent, double endIndent) {
    return Divider(
      color: context.theme.colorScheme.onSurface.withOpacity(0.4),
      indent: indent,
      endIndent: endIndent,
      thickness: 1,
    );
  }

  Row get _facebookAndGoogleIcon => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.instance.loginFaceBookIcon.toIconPng,
              height: context.normalValue * 2, fit: BoxFit.cover),
          SizedBox(width: context.width * 0.18),
          Image.asset(ImageConstants.instance.loginGoogleIcon.toIconPng,
              height: context.normalValue * 2, fit: BoxFit.cover),
        ],
      );
}
