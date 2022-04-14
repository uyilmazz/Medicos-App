import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({Key? key, required this.iconName}) : super(key: key);

  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.05,
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            context.theme.colorScheme.primary,
            context.theme.colorScheme.primary.withOpacity(0.6)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Image.asset(iconName, fit: BoxFit.fill),
    );
  }
}
