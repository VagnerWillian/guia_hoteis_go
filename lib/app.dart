import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

import '_shared/_shared.dart';
import 'core/constants/_constants.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(AppRoutes.splashRoute);

    return ToastificationWrapper(
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        locale: const Locale('pt', 'BR'),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        debugShowCheckedModeBanner: false,
        theme: AppLightTheme.theme,
        // theme: AppDarkTheme.theme,
        builder: (_, child) {
          if (DateTime.now().isAfter(DateTime(2025, 02, 19))) {
            return const Scaffold(
              body: Center(
                child: Text('APK Expirado'),
              ),
            );
          }
          return ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 692, name: MOBILE),
              const Breakpoint(start: 692, end: 1000, name: TABLET),
              const Breakpoint(start: 1000, end: 20000, name: DESKTOP),
            ],
          );
        },
      ),
    );
  }
}
