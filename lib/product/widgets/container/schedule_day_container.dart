import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';

class ScheduleDayContainer extends StatelessWidget {
  const ScheduleDayContainer(
      {Key? key,
      this.isSelected = false,
      required this.dayText,
      required this.dayValue})
      : super(key: key);

  final bool isSelected;
  final String dayText;
  final String dayValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: context.lowValue * 1.5),
      padding: EdgeInsets.symmetric(horizontal: context.lowValue),
      width: context.width * 0.15,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                      context.theme.colorScheme.tertiary,
                      context.theme.colorScheme.tertiary.withOpacity(0.1)
                    ])
              : null,
          color: isSelected
              ? context.theme.colorScheme.tertiary
              : context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(dayText,
                style: context.textTheme.subtitle2!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.background)),
            Text(dayValue,
                style: context.textTheme.headline6!
                    .copyWith(fontWeight: FontWeight.w500)),
          ]),
    );
  }
}
