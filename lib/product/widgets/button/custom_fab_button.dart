import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';

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
          margin: EdgeInsets.only(bottom: context.lowValue),
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.1,
              vertical: context.lowValue * 1.4),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, context.normalValue),
                    // spreadRadius: 1,
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
              style: context.textTheme.headline6!.copyWith(
                  fontSize: 20,
                  color: context.theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.w700))),
    );
  }
}
