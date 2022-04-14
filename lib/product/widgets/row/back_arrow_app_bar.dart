import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/icon_button/back_arrow.dart';

class BackArrowAppBar extends StatelessWidget {
  const BackArrowAppBar({Key? key, this.imageUrl, this.centerText})
      : super(key: key);

  final String? imageUrl;
  final String? centerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackArrowButton(context),
        centerText != null ? _centerText(context) : const SizedBox(),
        imageUrl != null ? _shoppingIcon(context) : _emptyContainer(context)
      ],
    );
  }

  Text _centerText(BuildContext context) {
    return Text(centerText!,
        style: context.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.colorScheme.primary));
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
      child: Image.asset(imageUrl!, fit: BoxFit.fill),
    );
  }

  Container _emptyContainer(BuildContext context) {
    return Container(
        height: context.height * 0.05,
        width: context.width * 0.1,
        color: Colors.transparent);
  }
}
