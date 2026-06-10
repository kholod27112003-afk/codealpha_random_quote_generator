import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      textTheme: TextTheme(
        displayMedium: AppTextStyles.quoteText.copyWith(color: AppColors.lightTextPrimary),
        titleLarge: AppTextStyles.appBarTitle.copyWith(color: AppColors.lightTextPrimary),
        bodyLarge: AppTextStyles.authorText.copyWith(color: AppColors.lightTextPrimary.withOpacity(0.7)),
        labelLarge: AppTextStyles.buttonText,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: const Color(0xFF0F172A),
      textTheme: TextTheme(
        displayMedium: AppTextStyles.quoteText.copyWith(color: AppColors.darkTextPrimary),
        titleLarge: AppTextStyles.appBarTitle.copyWith(color: AppColors.darkTextPrimary),
        bodyLarge: AppTextStyles.authorText.copyWith(color: AppColors.darkTextPrimary.withOpacity(0.7)),
        labelLarge: AppTextStyles.buttonText,
      ),
    );
  }
}