import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  /// LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.lightText),
      titleTextStyle: AppTextStyles.bold(20, color: AppColors.lightText),
    ),

    textTheme: TextTheme(
      headlineMedium: AppTextStyles.bold(24, color: AppColors.lightText),
      titleMedium: AppTextStyles.semiBold(18, color: AppColors.lightText),
      bodyMedium: AppTextStyles.regular(16, color: AppColors.lightGrey),
    ),
  );

  /// DARK THEME
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkText),
      titleTextStyle: AppTextStyles.bold(20, color: AppColors.darkText),
    ),

    textTheme: TextTheme(
      headlineMedium: AppTextStyles.bold(24, color: AppColors.darkText),
      titleMedium: AppTextStyles.semiBold(18, color: AppColors.darkText),
      bodyMedium: AppTextStyles.regular(16, color: AppColors.darkGrey),
    ),
  );
}
