import 'package:flutter/material.dart';
import 'package:medicos_app/view/user/view/login_page.dart';
import 'package:medicos_app/view/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
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
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _oldPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

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
                  _oldPasswordFormItem,
                  _newPasswordFormItem,
                  _confirmPassswordFormItem,
                  SizedBox(height: context.height * 0.05),
                  CustomFabButton(
                      text: LocaleKeys.profile_done.locale,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          final result = await context
                              .read<UserViewModel>()
                              .updatePassword(
                                  _newPasswordController.text.trim());
                          if (result) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()),
                                (route) => false);
                          }
                        }
                      })
                ],
              ),
            )));
  }

  FormItem get _oldPasswordFormItem => FormItem(
        headText: LocaleKeys.profile_oldPassword.locale,
        bottomSpace: context.normalValue,
        textformField: PasswordTextFormField(
            context: context,
            controller: _oldPasswordController,
            suffixOnPressed: () {
              setState(() {
                _oldPasswordObsure = !_oldPasswordObsure;
              });
            },
            obcure: _oldPasswordObsure,
            maxLine: 1,
            validateFunc: (value) {
              if (context.read<UserViewModel>().user?.password ==
                  _oldPasswordController.text) {
                return null;
              }
              return LocaleKeys.profile_oldPasswordValidate.locale;
            }),
      );

  FormItem get _newPasswordFormItem => FormItem(
        headText: LocaleKeys.profile_newPassword.locale,
        bottomSpace: context.normalValue,
        textformField: PasswordTextFormField(
            context: context,
            controller: _newPasswordController,
            suffixOnPressed: () {
              setState(() {
                _newPasswordObsure = !_newPasswordObsure;
              });
            },
            obcure: _newPasswordObsure,
            maxLine: 1,
            validateFunc: (value) {
              if (value != null && value.length >= 3) {
                return null;
              }
              return LocaleKeys.profile_newPasswordValidate.locale;
            }),
      );

  FormItem get _confirmPassswordFormItem => FormItem(
        headText: LocaleKeys.profile_confirmPassword.locale,
        bottomSpace: context.normalValue,
        textformField: PasswordTextFormField(
            context: context,
            controller: _confirmPasswordController,
            suffixOnPressed: () {
              setState(() {
                _confirmPasswordObsure = !_confirmPasswordObsure;
              });
            },
            obcure: _confirmPasswordObsure,
            maxLine: 1,
            validateFunc: (value) {
              if (value == _newPasswordController.text) {
                return null;
              }
              return LocaleKeys.profile_confirmPasswordValidate.locale;
            }),
      );
}
