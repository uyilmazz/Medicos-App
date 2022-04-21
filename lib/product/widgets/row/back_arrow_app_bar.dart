import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/icon_button/back_arrow.dart';
import '../container/icon_container.dart';

class BackArrowAppBar extends StatelessWidget {
  const BackArrowAppBar(
      {Key? key, this.imageUrl, this.centerText, this.iconOnTap})
      : super(key: key);

  final String? imageUrl;
  final String? centerText;
  final void Function()? iconOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackArrowButton(context),
        centerText != null ? _centerText(context) : const SizedBox(),
        imageUrl != null
            ? IconContainer(iconName: imageUrl!, onTap: iconOnTap)
            : _emptyContainer(context)
      ],
    );
  }

  Text _centerText(BuildContext context) {
    return Text(centerText!,
        style: context.textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.colorScheme.primary));
  }

  Container _emptyContainer(BuildContext context) {
    return Container(
        height: context.height * 0.05,
        width: context.width * 0.1,
        color: Colors.transparent);
  }
}
