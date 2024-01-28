import 'package:flutter/material.dart';

TextTheme textStyles() {
  return const TextTheme(
    headlineSmall: TextStyle(
      color: Color.fromRGBO(183, 239, 197, 1),
      fontSize: 12,
      fontFamily: 'ProductSans',
    ),
    headlineMedium: TextStyle(
      color: Color.fromRGBO(183, 239, 197, 1),
      fontSize: 15,
      fontFamily: 'ProductSans',
    ),
    headlineLarge: TextStyle(
      color: Color.fromRGBO(183, 239, 197, 1),
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'ProductSans',
    ),
    titleLarge: (TextStyle(
      color: Color.fromRGBO(183, 239, 197, 1),
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: 'ProductSans',
    )),
    titleMedium: TextStyle(
      color: Color.fromRGBO(183, 239, 197, 1),
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontFamily: 'ProductSans',
    ),
    titleSmall: TextStyle(
      color: Color.fromRGBO(183, 239, 197, 1),
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'ProductSans',
    ),
    bodySmall: TextStyle(
      color: Color.fromRGBO(183, 239, 197, 0.4),
      fontSize: 14,
      fontFamily: 'ProductSans',
    ),
    bodyMedium: TextStyle(
      color: Color.fromRGBO(183, 239, 197, 1),
      fontSize: 16,
      fontFamily: 'ProductSans',
    ),
  );
}
