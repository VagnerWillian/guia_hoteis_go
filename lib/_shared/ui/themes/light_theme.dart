import 'package:flutter/material.dart';

class AppLightTheme {
  static const primaryColor = Color(0xFFE6000C);
  static const appBarColor = primaryColor;
  static const secondaryColor = Color(0xFFCA0000);
  static const scaffoldColor = Color(0xFFF5F4F9);
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
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: defaultTextColor, fontSize: 14),
          bodyMedium: TextStyle(color: defaultTextColor, fontSize: 18),
          bodyLarge: TextStyle(color: defaultTextColor, fontSize: 22),
        ),
      );
}
