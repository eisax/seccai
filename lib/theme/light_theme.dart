import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: const Color(0xFFFF6D6D),
    secondaryHeaderColor: const Color(0xFF4794FF),
    disabledColor: const Color(0xFFBABFC4),
    brightness: Brightness.light,
    shadowColor: Colors.grey[300],
    hintColor: const Color(0xFF9F9F9F),
    cardColor: Colors.white,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Color(0xFF25282D)),
      titleLarge: TextStyle(color: Color(0xFF334257)),
      titleSmall: TextStyle(color: Color(0xFF25282D)),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: const Color(0xFFdcb247))),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    colorScheme: const ColorScheme.light(
            primary: Color(0xFFdcb247), secondary: Color(0xFFdcb247))
        .copyWith(background: const Color(0xFFFCFCFC))
        .copyWith(error: const Color(0xFFE84D4F)));
