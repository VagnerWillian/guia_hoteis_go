import 'package:flutter/material.dart';

class AppLightTheme {
  static const primaryColor = Color(0xFFE6000C);
  static const appBarColor = primaryColor;
  static const secondaryColor = Color(0xFFCA0000);
  static const scaffoldColor = Color(0xFFF0F0F0);
  static const containerColor = Color(0xFFFFFFFF);
  static const greyBrightnessColor = Color(0xFF464646);

  static ThemeData get theme => ThemeData(
        fontFamily: 'Titillium',
        scaffoldBackgroundColor: scaffoldColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: appBarColor,
          surfaceTintColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: greyBrightnessColor,
          textColor: greyBrightnessColor,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFFFFF8F6),
          shape: RoundedRectangleBorder(),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: greyBrightnessColor,
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
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return primaryColor;
            return Colors.grey;
          }),
          thumbColor: const WidgetStatePropertyAll(Colors.white),
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return primaryColor;
            return Colors.grey;
          }),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            color: greyBrightnessColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: greyBrightnessColor,
            fontSize: 18,
          ),
          bodyLarge: TextStyle(
            color: greyBrightnessColor,
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
