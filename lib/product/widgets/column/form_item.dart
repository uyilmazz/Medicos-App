import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

class FormItem extends StatelessWidget {
  const FormItem(
      {Key? key,
      required this.headText,
      required this.textformField,
      required this.bottomSpace})
      : super(key: key);

  final String headText;
  final Widget textformField;
  final double bottomSpace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headText,
            style: context.textTheme.headline6!
                .copyWith(letterSpacing: -0.5, fontWeight: FontWeight.w600)),
        SizedBox(height: context.lowValue),
        textformField,
        SizedBox(height: bottomSpace),
      ],
    );
  }
}
