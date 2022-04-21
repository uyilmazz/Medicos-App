import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/text_form_field/custom_text_form_field.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/container/icon_container.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../../../product/widgets/textField/user_text_form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final String _userProfileImage = 'user_profile';

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late GlobalKey _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();

    _nameController.text = 'Wade Warren';
    _emailController.text = 'adc@gmail.com';
    _phoneNumberController.text = '(603) 555-0123';
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = 'Wade Warren';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: context.appPadding,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              BackArrowAppBar(
                  centerText: LocaleKeys.profile_editProfile.locale),
              SizedBox(height: context.mediumValue),
              _profileAvatarStack(context),
              SizedBox(height: context.normalValue),
              _nameFormItem(context),
              _emailFormItem(context),
              _phoneNumberFormItem(context),
              SizedBox(height: context.normalValue),
              CustomFabButton(text: LocaleKeys.profile_done.locale),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _profileAvatarStack(BuildContext context) {
    return SizedBox(
      height: context.height * 0.22,
      child: Stack(
        children: [
          CircleAvatar(
              radius: context.height * 0.1,
              backgroundImage: AssetImage(_userProfileImage.toImagePng)),
          Positioned(
              bottom: context.lowValue * 0.4,
              right: context.lowValue,
              child:
                  IconContainer(iconName: 'camera'.toIconPng, paddingValue: 11))
        ],
      ),
    );
  }

  Column _nameFormItem(BuildContext context) {
    return _formItem(context, LocaleKeys.profile_name, _nameController,
        (value) {
      if (value == null || value.length < 3) {
        return LocaleKeys.profile_nameValidate.locale;
      }
      return null;
    });
  }

  Column _emailFormItem(BuildContext context) {
    return _formItem(context, LocaleKeys.profile_email, _emailController,
        (value) {
      if (value == null || !value.emailRegex) {
        return LocaleKeys.profile_emailValidate.locale;
      }
      return null;
    });
  }

  Column _phoneNumberFormItem(BuildContext context) {
    return _formItem(
        context, LocaleKeys.profile_phoneNumber, _phoneNumberController,
        (value) {
      if (value == null || value.length != 10) {
        return LocaleKeys.profile_phoneNumberValidate.locale;
      }
      return null;
    });
  }

  Column _formItem(BuildContext context, String headText,
      TextEditingController controller, ValidateFunction validate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headText.locale,
            style: context.textTheme.headline6!
                .copyWith(letterSpacing: -0.5, fontWeight: FontWeight.w600)),
        SizedBox(height: context.lowValue),
        UserTextFormField(
            maxLine: 2, controller: controller, validateFunc: validate),
        SizedBox(height: context.normalValue * 1.5),
      ],
    );
  }
}
