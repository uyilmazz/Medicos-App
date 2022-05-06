import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medicos_app/core/init/cache/local_cache_manager.dart';
import 'view/onboard/view/welcome_screen_view.dart';
import 'view/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_constant.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalCacheManager.instance.sharedPreferencesInit();
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
      home: const WelcomeScreenView(),
    );
  }
}
