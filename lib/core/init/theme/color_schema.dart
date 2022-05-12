import 'package:flutter/material.dart';

class CustomColorSchema {
  static CustomColorSchema? _instance;
  static CustomColorSchema get instance {
    _instance ??= CustomColorSchema._init();
    return _instance!;
  }

  CustomColorSchema._init();

  ColorScheme colorScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF06919D),
      onPrimary: Color(0xFFE8505B),
      secondary: Colors.amber,
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFFA0A0A),
      onError: Color(0xFFA7979B),
      background: Color(0xFF73696C),
      onBackground: Color(0xFF828282),
      tertiary: Color(0xFFDD505A),
      surfaceVariant: Color(0xFFEBEBEB),
      onTertiary: Color(0xFF00FF00),
      surface: Colors.black12,
      onSurface: Colors.black);
}
