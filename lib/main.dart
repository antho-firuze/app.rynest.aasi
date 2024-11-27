import 'dart:io';

import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/core/app_theme.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:app.rynest.aasi/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/notification_helper.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFlutterNotifications();
  HttpOverrides.global = MyHttpOverrides();

  final pref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPrefProvider.overrideWithValue(pref),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      themeMode: themeMode,
      routerConfig: goRouter,
      scaffoldMessengerKey: scaffoldKey,
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //   name: 'aasi',
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );
//   await setupFlutterNotifications();
//   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//   //   statusBarColor: Colors.transparent, // transparent status bar
//   // ));
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   await setupLocator();
//   HttpOverrides.global = MyHttpOverrides();

//   runApp(
//     GetMaterialApp(
//       home: const MyApp(),
//       translations: Translation(),
//       locale: const Locale('id', 'ID'),
//       fallbackLocale: const Locale('id', 'ID'),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final scale = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.35);
//     return MaterialApp(
//       title: 'AASI',
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       //   fontFamily: 'Poppins',
//       //   visualDensity: VisualDensity.adaptivePlatformDensity,
//       // ),
//       onGenerateRoute: StackedRouter().onGenerateRoute,
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en', 'US'),
//         Locale('id', 'ID'),
//       ],
//     );
//   }
// }

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
