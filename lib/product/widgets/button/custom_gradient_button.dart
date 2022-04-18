import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({Key? key, required this.buttonText}) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.16, vertical: context.lowValue * 1.4),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
            ],
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  context.theme.colorScheme.primary,
                  context.theme.colorScheme.primary.withOpacity(0.3)
                ]),
            borderRadius: BorderRadius.circular(context.lowValue * 1.7)),
        child: Text(buttonText.locale,
            style: context.textTheme.headline6!.copyWith(
                fontSize: 17,
                color: context.theme.colorScheme.onSecondary,
                fontWeight: FontWeight.bold)));
  }
}
