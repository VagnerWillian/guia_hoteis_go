import 'package:flutter/material.dart';

class AppDarkTheme {
  static const primaryColor = Color(0xFFE6000C);
  static const appBarColor = Color(0xFF222222);
  static const secondaryColor = Color(0xFF171717);
  static const scaffoldColor = Color(0xFF171717);
  static const containerColor = Color(0xFFFFFFFF);
  static const defaultTextColor = Color(0xFF3C3C3C);

  static ThemeData get theme => ThemeData(
        fontFamily: 'Titillium',
        scaffoldBackgroundColor: scaffoldColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: appBarColor,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        drawerTheme: const DrawerThemeData(backgroundColor: scaffoldColor),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          primaryContainer: scaffoldColor,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: defaultTextColor, fontSize: 14),
          bodyMedium: TextStyle(color: defaultTextColor, fontSize: 18),
          bodyLarge: TextStyle(color: defaultTextColor, fontSize: 22),
        ),
      );
}
