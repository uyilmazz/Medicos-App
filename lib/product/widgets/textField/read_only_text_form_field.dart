import 'package:flutter/material.dart';
import '../../../core/widgets/text_form_field/custom_text_form_field.dart';

class ReadOnlyTextFormField extends CustomTextFormField {
  final int maxLine;
  final String? initText;

  const ReadOnlyTextFormField({
    Key? key,
    required this.maxLine,
    this.initText,
  }) : super(key: key, readOnly: true, maxLines: maxLine, text: initText);
}
