import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/text/auth_head_text.dart';
import '../../../core/widgets/text/auth_rich_text.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/dialog/success_diloag.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _otpNumberOne;
  late final TextEditingController _otpNumberTwo;
  late final TextEditingController _otpNumberThree;
  late final TextEditingController _otpNumberFour;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _otpNumberOne = TextEditingController();
    _otpNumberTwo = TextEditingController();
    _otpNumberThree = TextEditingController();
    _otpNumberFour = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: context.appPadding,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.height * 0.07),
                  AuthHeadText(text: LocaleKeys.login_verification.locale),
                  SizedBox(height: context.lowValue),
                  Text(LocaleKeys.login_verificationDescText.locale,
                      style: context.textTheme.subtitle1!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
                  SizedBox(height: context.height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _verificationFormItem(_otpNumberOne,
                          isFirst: true, isLast: false),
                      _verificationFormItem(_otpNumberTwo,
                          isFirst: false, isLast: false),
                      _verificationFormItem(_otpNumberThree,
                          isFirst: false, isLast: false),
                      _verificationFormItem(_otpNumberFour,
                          isFirst: false, isLast: true),
                    ],
                  ),
                  SizedBox(height: context.normalValue),
                  Align(
                      alignment: Alignment.center, child: _resendAndConfirmBtn)
                ],
              ),
            )));
  }

  SizedBox _verificationFormItem(TextEditingController controller,
      {required bool isFirst, isLast}) {
    return SizedBox(
      width: context.width * 0.2,
      child: TextFormField(
        controller: controller,
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && isLast == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && isFirst == false) {
            FocusScope.of(context).previousFocus();
          }
          if (value.isNotEmpty && isLast == true) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: context.textTheme.headline6,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        validator: (value) {
          if (value != null && value.length == 1) {
            return null;
          }
          return '';
        },
        decoration: InputDecoration(
          errorText: '',
          hintText: '-',
          filled: true,
          fillColor: context.theme.colorScheme.onSecondary,
          isDense: true,
          focusedErrorBorder: _outlinedBorder,
          errorBorder: _outlinedBorder,
          enabledBorder: _outlinedBorder,
          focusedBorder: _outlinedBorder,
        ),
      ),
    );
  }

  OutlineInputBorder get _outlinedBorder => OutlineInputBorder(
      borderSide: BorderSide(color: context.theme.scaffoldBackgroundColor),
      borderRadius: BorderRadius.circular(context.normalValue * 1));

  Column get _resendAndConfirmBtn => Column(
        children: [
          AuthRichText(
              textOne: LocaleKeys.login_resendIn.locale, textTwo: '00:50'),
          AuthRichText(
              textOne: LocaleKeys.login_dontReceiveCode.locale,
              textTwo: LocaleKeys.login_resend.locale),
          SizedBox(height: context.height * 0.1),
          CustomFabButton(
              text: LocaleKeys.doctorAppointment_confirm.locale,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                      barrierColor: const Color(0xFFC4C4C4).withOpacity(0.55),
                      context: context,
                      builder: (context) => SuccessDialog(
                          buttonText: LocaleKeys.login_loginNow.locale,
                          descText: LocaleKeys.login_successVerification.locale,
                          image: ImageConstants
                              .instance.successVerificationImage.toImagePng));
                } else {}
              })
        ],
      );
}
