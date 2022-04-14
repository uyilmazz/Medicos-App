import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medicos_app/view/doctor/view/doctor_view.dart';
import 'package:medicos_app/view/home/view/home_page.dart';
import 'package:medicos_app/view/pharmacy/view/pharmacy_view.dart';
import 'core/constants/app_constant.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      child: const MyApp(),
      startLocale: LanguageManager.instance.enLocale,
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstants.languagePath));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.instance.theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Material App',
      home: const HomePage(),
    );
  }
}
