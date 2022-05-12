import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../home/view/home_page.dart';
import '../view_model/user_view_model.dart';
import 'package:provider/provider.dart';
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
  File? _profileImage;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final _provider = Provider.of<UserViewModel>(context, listen: false);
      _nameController.text = _provider.user?.name ?? '';
      _emailController.text = _provider.user?.email ?? '';
      _phoneNumberController.text = _provider.user?.phoneNumber ?? '';
    });
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
                  centerText: LocaleKeys.profile_editProfile.locale),
              SizedBox(height: context.mediumValue),
              _profileAvatarStack(context),
              SizedBox(height: context.normalValue),
              _nameFormItem(context),
              _emailFormItem(context),
              _phoneNumberFormItem(context),
              SizedBox(height: context.normalValue),
              _fabButton(context),
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
          _profileAvatar(context),
          Positioned(
              bottom: context.lowValue * 0.4,
              right: context.lowValue,
              child: IconContainer(
                  onTap: () async {
                    var picture = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (picture != null) {
                      setState(() {
                        _profileImage = File(picture.path);
                      });
                    }
                  },
                  iconName: 'camera'.toIconPng,
                  paddingValue: 11))
        ],
      ),
    );
  }

  CircleAvatar _profileAvatar(BuildContext context) {
    return _profileImage != null
        ? CircleAvatar(
            radius: context.height * 0.1,
            backgroundImage: FileImage(_profileImage!))
        : context.watch<UserViewModel>().user?.imageUrl != null
            ? CircleAvatar(
                radius: context.height * 0.1,
                backgroundImage: NetworkImage(
                    context.watch<UserViewModel>().user!.imageUrl!.networkUrl))
            : CircleAvatar(
                radius: context.height * 0.1,
                backgroundImage: AssetImage(_userProfileImage.toImagePng));
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

  Widget _fabButton(BuildContext context) => CustomFabButton(
      text: LocaleKeys.profile_done.locale,
      onTap: () async {
        final response = await context.read<UserViewModel>().updateProfile(
            name: _nameController.text,
            email: _emailController.text,
            phoneNumber: _phoneNumberController.text,
            imagePath: _profileImage?.path);
        if (response) {
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: context.theme.scaffoldBackgroundColor,
              elevation: 3,
              content: Text(LocaleKeys.profile_profileUpdatedMessage.locale,
                  style: context.textTheme.subtitle1!
                      .copyWith(color: context.theme.colorScheme.primary))));
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
        }
      });
}
