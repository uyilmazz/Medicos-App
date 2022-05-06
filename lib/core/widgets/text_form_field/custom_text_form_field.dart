import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

typedef ValidateFunction = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.textEditingController,
      this.maxLines = 2,
      this.text,
      this.readOnly = false,
      this.validate,
      this.isObsure,
      this.suffixIcon})
      : super(key: key);

  final TextEditingController? textEditingController;
  final int? maxLines;
  final String? text;
  final bool readOnly;
  final ValidateFunction validate;
  final bool? isObsure;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsure ?? false,
      controller: textEditingController,
      readOnly: readOnly,
      minLines: 1,
      maxLines: maxLines,
      initialValue: text,
      style: context.textTheme.headline6!.copyWith(
          fontSize: 19,
          color: context.theme.colorScheme.onSurface.withOpacity(0.5),
          fontWeight: FontWeight.w500),
      textAlignVertical: TextAlignVertical.top,
      validator: validate,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: context.theme.colorScheme.onSecondary,
          isDense: true,
          contentPadding: EdgeInsets.only(
              left: context.normalValue,
              right: context.normalValue,
              top: context.normalValue * 0.7,
              bottom: context.normalValue * 1.5),
          enabledBorder: _outlinedBorder(context),
          focusedBorder: _outlinedBorder(context),
          errorBorder: _outlinedBorder(context)),
    );
  }

  OutlineInputBorder _outlinedBorder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: context.theme.scaffoldBackgroundColor),
        borderRadius: BorderRadius.circular(context.normalValue * 1.2));
  }
}
