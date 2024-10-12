import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFF69B4); // Pink
  static const Color secondary = Color(0xFF20B2AA); // Light Sea Green
  static const Color background = Colors.white;
  static const Color text = Color(0xFF333333);
  static const Color accent = Color(0xFFFFA500);

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge:
            TextStyle(color: text, fontWeight: FontWeight.bold, fontSize: 20),
        bodyLarge: TextStyle(color: text, fontSize: 16),
        bodyMedium: TextStyle(color: text, fontSize: 14),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
