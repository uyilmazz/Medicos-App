import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class AnimatedCarousel extends StatelessWidget {
  const AnimatedCarousel({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: context.lowValue),
      height: context.normalValue * 0.8,
      width: context.normalValue,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.theme.colorScheme.primary),
          color: isActive
              ? context.theme.colorScheme.primary
              : context.theme.colorScheme.onSecondary),
    );
  }
}
