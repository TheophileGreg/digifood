import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      primaryColor: Colors.red,
      primaryColorLight: Colors.redAccent,
      dividerColor: Colors.grey,
      fontFamily: 'NouvelR',
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 40, color: Colors.black, height: 1),
        displayMedium: TextStyle(fontSize: 36, color: Colors.black, height: 1),
        displaySmall: TextStyle(fontSize: 28, color: Colors.black, height: 1),
        headlineLarge: TextStyle(fontSize: 28, color: Colors.black, height: 1),
        headlineMedium: TextStyle(fontSize: 24, color: Colors.black, height: 1),
        headlineSmall: TextStyle(fontSize: 20, color: Colors.black, height: 1),
        titleLarge: TextStyle(fontSize: 16, color: Colors.black, height: 1),
        titleMedium: TextStyle(fontSize: 14, color: Colors.black, height: 1),
        titleSmall: TextStyle(fontSize: 12, color: Colors.black, height: 1),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black,
          height: 1.15,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.black,
          height: 1.15,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.black,
          height: 1.15,
        ),
      ),
      bottomNavigationBarTheme:
          ThemeData.light().bottomNavigationBarTheme.copyWith(
                backgroundColor: Colors.white,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                ),
                selectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.blueGrey,
              ),
    );
