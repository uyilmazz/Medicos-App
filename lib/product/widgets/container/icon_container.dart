import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../view/pharmacy/view/cart_page.dart';

class IconContainer extends StatelessWidget {
  const IconContainer(
      {Key? key, required this.iconName, this.onTap, this.paddingValue})
      : super(key: key);

  final String iconName;
  final void Function()? onTap;
  final double? paddingValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
      child: Container(
        height: context.height * 0.05,
        padding: EdgeInsets.all(paddingValue ?? 9.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              context.theme.colorScheme.primary,
              context.theme.colorScheme.primary.withOpacity(0.6)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Image.asset(iconName, fit: BoxFit.fill),
      ),
    );
  }
}
