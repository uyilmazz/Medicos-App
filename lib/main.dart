import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medicos_app/view/doctor/view/doctor_appointment.dart';
import 'view/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'view/home/view/home_page.dart';
import 'core/constants/app_constant.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => UserViewModel(),
    child: EasyLocalization(
        child: const MyApp(),
        startLocale: LanguageManager.instance.enLocale,
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstants.languagePath),
  ));
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
      home: DoctorAppointmentView(),
    );
  }
}
