import 'package:flutter/material.dart';

class AppDarkTheme {
  static const primaryColor = Color(0x27434343);
  static const appBarColor = Color(0xFF222222);
  static const secondaryColor = Color(0xFF171717);
  static const scaffoldColor = Color(0xFF101010);
  static const containerColor = Color(0xFFFFFFFF);
  static const defaultTextColor = Color(0xFF6C6C6C);
  static const greyBrightnessColor = Color(0xFF464646);

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
        splashColor: greyBrightnessColor,
        canvasColor: greyBrightnessColor,
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
            if (states.contains(WidgetState.selected)) return Colors.grey;
            return greyBrightnessColor;
          }),
        ),
        chipTheme: ChipThemeData(
          selectedColor: primaryColor,
          backgroundColor: scaffoldColor,
          disabledColor: scaffoldColor,
          side: const BorderSide(color: greyBrightnessColor, width: 1),
          iconTheme: const IconThemeData(
            color: greyBrightnessColor,
          ),
          labelStyle: TextStyle(
            color: Colors.white.withValues(alpha: .4),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          surfaceBright: Colors.white54,
          primaryContainer: scaffoldColor,
          secondaryContainer: appBarColor,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: defaultTextColor, fontSize: 14),
          bodyMedium: TextStyle(color: defaultTextColor, fontSize: 18),
          bodyLarge: TextStyle(color: defaultTextColor, fontSize: 22),
          headlineSmall: TextStyle(color: greyBrightnessColor),
          headlineMedium: TextStyle(color: greyBrightnessColor),
          headlineLarge: TextStyle(color: greyBrightnessColor),
        ),
      );
}
