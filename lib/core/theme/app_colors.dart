import 'package:flutter/material.dart';

class AppColors {
  // Light colors
  static const Color lightBackground = Colors.white;
  static const Color lightText = Colors.black;
  static const Color lightGrey = Color(0xFF7A7A7A);
  static const Color lightSelected = Colors.black;
  static const Color lightUnselected = Color(0xFF7A7A7A);

  // Dark colors
  static const Color darkBackground = Color(0xFF1C1C1E);
  static const Color darkText = Colors.white;
  static const Color darkGrey = Color(0xFFB3B3B3);

  /// Automatically pick color based on theme brightness
  static Color selectedText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightText
        : darkText;
  }

  static Color unselectedText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightGrey
        : darkGrey;
  }

  // Common colors
  static const Color primary = Color(0xFF0A84FF);
}
