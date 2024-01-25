import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    background: Color.fromRGBO(126, 74, 75, 1),
    primary: Color.fromRGBO(63, 37, 38, 1),
    secondary: Color.fromRGBO(251, 195, 197, 1),
    tertiary: Color.fromRGBO(189, 135, 136, 1),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
    ),
  ),
);
