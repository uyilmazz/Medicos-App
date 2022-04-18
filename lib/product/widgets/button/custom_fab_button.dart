import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

class CustomFabButton extends StatelessWidget {
  const CustomFabButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: context.width * 0.6,
          margin: EdgeInsets.only(bottom: context.lowValue),
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.1,
              vertical: context.lowValue * 1.3),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, context.normalValue),
                    blurRadius: 56,
                    color: context.theme.colorScheme.primary.withOpacity(0.35))
              ],
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    context.theme.colorScheme.primary,
                    context.theme.colorScheme.primary.withOpacity(0.3)
                  ]),
              borderRadius: BorderRadius.circular(context.lowValue * 1.7)),
          child: Text(text,
              textAlign: TextAlign.center,
              style: context.textTheme.headline2!.copyWith(
                  fontSize: 18,
                  color: context.theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.w700))),
    );
  }
}
