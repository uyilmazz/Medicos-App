import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/text_form_field/custom_text_form_field.dart';

class PasswordTextFormField extends CustomTextFormField {
  final TextEditingController controller;
  final int? maxLine;
  final ValidateFunction validateFunc;
  final bool? obcure;
  final void Function()? suffixOnPressed;
  final BuildContext context;

  PasswordTextFormField({
    required this.context,
    this.obcure = true,
    Key? key,
    required this.controller,
    this.suffixOnPressed,
    this.maxLine = 1,
    this.validateFunc,
  }) : super(
            key: key,
            maxLines: maxLine,
            isObsure: obcure,
            textEditingController: controller,
            suffixIcon: IconButton(
                padding: EdgeInsets.only(right: context.lowValue * 2),
                onPressed: suffixOnPressed,
                icon: Icon(Icons.visibility,
                    color: context.theme.colorScheme.onSurface,
                    size: context.normalValue * 1.4)),
            validate: validateFunc);
}
