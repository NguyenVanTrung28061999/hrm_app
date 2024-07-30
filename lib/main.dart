import 'dart:io';

import 'package:app_hrm/core/commons/palette.dart';
import 'package:app_hrm/core/translation/localization_service.dart';
import 'package:app_hrm/routes.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp(
    initialRoute: '/splash',
    payload: '',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final String payload;
  MyApp({Key? key, required this.initialRoute, required this.payload})
      : super(key: key);
  final GetPageApp _appRoute = GetPageApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRM App',
      theme: ThemeData(
        primarySwatch: Palette.primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
        //  textTheme: GoogleFonts.sarabunTextTheme(Theme.of(context).textTheme),
        fontFamily: "ProximaSoft",
      ),
      builder: BotToastInit(), //1. call BotToastInit
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      navigatorObservers: [BotToastNavigatorObserver()],
      getPages: _appRoute.onGenerateGetPage(payload),
      defaultTransition: Transition.cupertino,
      initialRoute: initialRoute,
    );
  }
}

// Way for skip problem of ssl certification.
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
