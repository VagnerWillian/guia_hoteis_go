import 'package:flutter/material.dart';

class AppDarkTheme{
  static const primaryColor = Color(0xFFE6000C);
  static const scaffoldColor = Color(0xFFF5F4F9);
  static const containerColor = Color(0xFFFFFFFF);


  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: scaffoldColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
    ),
      colorScheme: const ColorScheme.light(primary: primaryColor),
  );
}