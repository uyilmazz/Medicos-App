import 'package:flutter/material.dart';
import '../../../core/widgets/text_form_field/custom_text_form_field.dart';

class UserTextFormField extends CustomTextFormField {
  final TextEditingController controller;
  final int? maxLine;
  final ValidateFunction validateFunc;

  const UserTextFormField({
    Key? key,
    required this.controller,
    this.maxLine,
    this.validateFunc,
  }) : super(
            key: key,
            maxLines: maxLine,
            textEditingController: controller,
            validate: validateFunc);
}
