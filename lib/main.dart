import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/core/network/network_connection_checker.dart';
import 'package:getx_clean_architecture/core/theme/app_theme.dart';
import 'package:getx_clean_architecture/core/utils/local_storage/hive_storage.dart';
import 'package:getx_clean_architecture/core/values/constants.dart';
import 'package:getx_clean_architecture/core/values/languages/localization_service.dart';
import 'package:getx_clean_architecture/injection_container.dart';
import 'package:getx_clean_architecture/routes/app_pages.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await HiveStorage().init();
  await NetworkChecker.init();
  InjectionContainer.init();
  runApp(
    GetMaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            boldText: false,
            textScaler: const TextScaler.linear(1),
          ),
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        ),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      title: AppConstant.APP_NAME,
      theme: DAppTheme.lightTheme,
      darkTheme: DAppTheme.darkTheme,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      locale: LocalizationService.locale,
      supportedLocales: const <Locale>[
        Locale(LanguageCodeConstant.VI, LanguageCountryConstant.VI),
        Locale(LanguageCodeConstant.EN, LanguageCountryConstant.EN),
        Locale(LanguageCodeConstant.CN, LanguageCountryConstant.CN),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
