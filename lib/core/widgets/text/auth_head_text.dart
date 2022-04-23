import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class AuthHeadText extends StatelessWidget {
  const AuthHeadText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: context.textTheme.headline4!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: context.theme.colorScheme.primary));
  }
}
