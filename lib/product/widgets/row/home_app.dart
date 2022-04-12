import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';

import '../../../core/init/language/locale_keys.g.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, this.trailing, required this.imageUrl})
      : super(key: key);
  final Widget? trailing;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.goodMorning.locale,
            style: context.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.primary)),
        CircleAvatar(
            backgroundColor: context.theme.colorScheme.primary,
            child: Image.asset(imageUrl, fit: BoxFit.fill))
      ],
    );
  }
}
