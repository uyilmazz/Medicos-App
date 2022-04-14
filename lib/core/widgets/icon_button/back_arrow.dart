import 'package:flutter/material.dart';

class BackArrowButton extends IconButton {
  BackArrowButton(this.context,
      {Key? key, VoidCallback? onPressed, Widget? icon})
      : super(
            key: key,
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
            constraints: const BoxConstraints());

  final BuildContext context;
}
