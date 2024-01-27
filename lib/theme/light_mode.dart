import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    background: Color.fromRGBO(251, 195, 197, 1),
    primary: Color.fromRGBO(253, 225, 226, 1),
    secondary: Color.fromRGBO(198, 87, 92, 1),
    tertiary: Color.fromRGBO(252, 210, 212, 1),
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
