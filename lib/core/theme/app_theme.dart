import 'package:currencia_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Define light theme
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      colorScheme: ThemeData.light().colorScheme.copyWith(
            surface: AppColors.background,
          ),
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: AppColors.textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.buttonPrimary,
          backgroundColor: Colors.white,
        ),
      ),
      cardTheme: const CardTheme(color: AppColors.background));

  // Define dark theme
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
      dialogBackgroundColor: AppColors.darkBackground,
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textDarkPrimary),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textDarkPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: AppColors.textDarkSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.buttonPrimary,
          backgroundColor: Colors.white,
        ),
      ),
      cardTheme: const CardTheme(color: AppColors.darkBackground));
}
