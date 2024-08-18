import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app.rynest.aasi/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/app.locator.dart';
// import 'firebase_options.dart';
import 'helpers/notification_helper.dart';
import 'helpers/translation.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   name: 'aasi',
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await setupFlutterNotifications();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // transparent status bar
  // ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setupLocator();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    GetMaterialApp(
      home: const MyApp(),
      translations: Translation(),
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('id', 'ID'),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final scale = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.35);
    return MaterialApp(
      title: 'AASI',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   fontFamily: 'Poppins',
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
    );
  }
}

// HandshakeException: Handshake error in client (OS Error: E/flutter ( 6264):
// CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate(handshake.cc:363))
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
