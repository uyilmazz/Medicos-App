import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key? key,
      required this.buttonText,
      this.isSelected = true,
      this.width,
      this.onTap})
      : super(key: key);

  final String buttonText;
  final bool isSelected;
  final double? width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: context.lowValue * 1.4),
          decoration: BoxDecoration(
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                          offset: Offset(0, context.normalValue),
                          blurRadius: 56,
                          color: context.theme.colorScheme.primary
                              .withOpacity(0.35))
                    ]
                  : null,
              gradient: isSelected
                  ? LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                          context.theme.colorScheme.primary,
                          context.theme.colorScheme.primary.withOpacity(0.3)
                        ])
                  : null,
              border: !isSelected
                  ? Border.all(color: context.theme.colorScheme.primary)
                  : null,
              borderRadius: BorderRadius.circular(context.lowValue * 1.7)),
          child: Center(
            child: Text(buttonText,
                style: context.textTheme.headline6!.copyWith(
                    fontSize: 17,
                    color: isSelected
                        ? context.theme.colorScheme.onSecondary
                        : context.theme.colorScheme.primary,
                    fontWeight: FontWeight.bold)),
          )),
    );
  }
}
