import 'package:flutter/material.dart';

class AppLightTheme {
  static const primaryColor = Color(0xFFE6000C);
  static const appBarColor = primaryColor;
  static const secondaryColor = Color(0xFFCA0000);
  static const scaffoldColor = Color(0xFFF5F4F9);
  static const containerColor = Color(0xFFFFFFFF);
  static const defaultTextColor = Color(0xFF3E3E3E);

  static ThemeData get theme => ThemeData(
        fontFamily: 'Titillium',
        scaffoldBackgroundColor: scaffoldColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: appBarColor,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: defaultTextColor,
          textColor: defaultTextColor,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFFFFF8F6),
          shape: RoundedRectangleBorder(),
        ),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          primaryContainer: containerColor,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            color: defaultTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: defaultTextColor,
            fontSize: 18,
          ),
          bodyLarge: TextStyle(
            color: defaultTextColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
          titleMedium: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
          titleLarge: TextStyle(
            color: primaryColor,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
}
