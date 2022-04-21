import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';

class ExperienceRichText extends StatelessWidget {
  const ExperienceRichText({Key? key, required this.experienceValue})
      : super(key: key);

  final String experienceValue;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: LocaleKeys.experience.locale,
            style: context.textTheme.subtitle2!
                .copyWith(fontWeight: FontWeight.w600),
            children: [
          WidgetSpan(child: SizedBox(width: context.lowValue)),
          TextSpan(
              text: LocaleKeys.years.paramLocale([experienceValue]),
              style: context.textTheme.subtitle2!
                  .copyWith(fontWeight: FontWeight.w500))
        ]));
  }
}
