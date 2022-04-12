import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

class FlexibleText extends Flexible {
  FlexibleText(this.text, this.context, {Key? key})
      : super(
            key: key,
            child: Text(text,
                style: context.textTheme.headlineSmall!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                softWrap: false,
                overflow: TextOverflow.ellipsis));

  final String text;
  final BuildContext context;
}
