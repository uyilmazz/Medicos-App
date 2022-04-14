import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, required this.imageUrl, this.isShop = false})
      : super(key: key);

  final String imageUrl;
  final bool isShop;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.goodMorning.locale,
            style: context.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.primary)),
        isShop ? _shoppingIcon(context) : _profileAvatar(context)
      ],
    );
  }

  Container _shoppingIcon(BuildContext context) {
    return Container(
      height: context.height * 0.05,
      width: context.width * 0.1,
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            context.theme.colorScheme.primary,
            context.theme.colorScheme.primary.withOpacity(0.6)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Image.asset('shopping'.toIconPng, fit: BoxFit.fill),
    );
  }

  Container _profileAvatar(BuildContext context) {
    return Container(
      height: context.height * 0.05,
      width: context.width * 0.1,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(imageUrl, fit: BoxFit.fill),
    );
  }
}
