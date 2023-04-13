import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade300,
  primaryColor: Colors.grey.shade700,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: Colors.grey.shade700,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
  ),
);
