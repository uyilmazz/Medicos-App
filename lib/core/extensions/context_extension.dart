import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double dynamicWidth(double value) => width * value;
  double dynamicHeight(double value) => height * value;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  EdgeInsets get appPadding =>
      const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 0);
}

extension PageColorExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
