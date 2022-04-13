import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';

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
        _backArrawIcon(context),
        centerText != null ? _centerText(context) : const SizedBox(),
        imageUrl != null ? _shoppingIcon(context) : _emptyContainer(context)
      ],
    );
  }

  IconButton _backArrawIcon(BuildContext context) {
    return IconButton(
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back));
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
