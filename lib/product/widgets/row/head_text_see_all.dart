import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';

class HeadAndSeeAllText extends StatelessWidget {
  const HeadAndSeeAllText(
      {Key? key, required this.headText, this.isSeeAll = true, this.onTap})
      : super(key: key);
  final String headText;
  final bool isSeeAll;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headText.locale,
            style: context.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.w500)),
        InkWell(
          onTap: onTap,
          child: Text(!isSeeAll ? '' : LocaleKeys.seeAll.locale,
              style: context.textTheme.subtitle1!.copyWith(
                  color: context.theme.colorScheme.onSurface.withAlpha(122),
                  fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
