import 'package:flutter/cupertino.dart';
import '../../../core/extensions/context_extension.dart';

class CustomFittedBox extends FittedBox {
  CustomFittedBox(this.context, {Key? key, required this.text})
      : super(
            key: key,
            fit: BoxFit.scaleDown,
            child: Text(text,
                style: context.textTheme.subtitle2!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w500)));

  final String text;
  final BuildContext context;
}
