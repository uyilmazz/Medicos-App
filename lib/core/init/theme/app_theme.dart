import 'package:flutter/material.dart';
import '../../constants/app_constant.dart';
import 'Iapp_theme.dart';

class AppTheme extends IAppTheme {
  static AppTheme? _instance;
  static AppTheme get instance => _instance ??= AppTheme._init();

  AppTheme._init();

  ThemeData get theme => ThemeData(
      iconTheme: IconThemeData(color: customColorSchema.colorScheme.onSurface),
      fontFamily: AppConstants.FONT_FAMILY,
      textTheme: customTextTheme.textTheme,
      scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      colorScheme: customColorSchema.colorScheme);
}
