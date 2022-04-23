import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText(
      {Key? key, required this.textOne, required this.textTwo, this.onTap})
      : super(key: key);

  final String textOne;
  final String textTwo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: textOne + ' ',
            style: context.textTheme.subtitle2!
                .copyWith(fontWeight: FontWeight.w500),
            children: [
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              text: textTwo,
              style: context.textTheme.subtitle1!.copyWith(
                  fontSize: 17,
                  color: context.theme.colorScheme.primary,
                  fontWeight: FontWeight.w700))
        ]));
  }
}
