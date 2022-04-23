import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/text/auth_head_text.dart';
import '../button/custom_fab_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog(
      {Key? key,
      required this.image,
      required this.descText,
      required this.buttonText})
      : super(key: key);

  final String image;
  final String descText;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(bottom: context.height * 0.1),
      backgroundColor: context.theme.colorScheme.onSecondary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.normalValue)),
      elevation: 0,
      child: SizedBox(
          height: context.height * 0.39,
          width: context.width * 0.8,
          child: Column(
            children: [
              SizedBox(height: context.normalValue * 1.2),
              Image.asset(image,
                  height: context.height * 0.15, fit: BoxFit.cover),
              SizedBox(height: context.normalValue),
              AuthHeadText(text: LocaleKeys.order_great.locale),
              Text(descText,
                  style: context.textTheme.subtitle1!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
              SizedBox(height: context.normalValue * 1.5),
              CustomFabButton(text: buttonText)
            ],
          )),
    );
  }
}
