import 'package:flutter/material.dart';

import '../../../core/widgets/text_form_field/custom_text_form_field.dart';

class PasswordTextFormField extends CustomTextFormField {
  final TextEditingController controller;
  final int? maxLine;
  final ValidateFunction validateFunc;
  final bool? obsure;
  final void Function()? suffixOnPressed;

  PasswordTextFormField({
    this.obsure = true,
    Key? key,
    required this.controller,
    this.suffixOnPressed,
    this.maxLine = 1,
    this.validateFunc,
  }) : super(
            key: key,
            maxLines: maxLine,
            isObsure: obsure,
            textEditingController: controller,
            suffixIcon: IconButton(
                onPressed: suffixOnPressed,
                icon: const Icon(Icons.visibility, color: Colors.black)),
            validate: validateFunc);
}
