import 'package:flutter/material.dart';
import 'colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.cardBackground,
    appBarTheme: const AppBarTheme(
      color: AppColors.cardBackground,
      iconTheme: IconThemeData(color: AppColors.cardBackground),
      titleTextStyle: TextStyle(
        color: AppColors.cardBackground,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge:  TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 10),
      titleLarge: TextStyle(
          color: AppColors.cardBackground, fontSize: 18, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: AppColors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.primaryBlue,
        backgroundColor: AppColors.cardBackground,
        side: const BorderSide(color: AppColors.textSecondary),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF2E8EB),
      iconTheme: IconThemeData(color: AppColors.primaryBlue),
      titleTextStyle: TextStyle(
        color: AppColors.primaryBlue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.cardBackground),
      bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 10),
      titleLarge: TextStyle(
          color: AppColors.cardBackground, fontSize: 18, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: AppColors.cardBackground),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.primaryBlue,
        backgroundColor: AppColors.cardBackground,
        side: const BorderSide(color: AppColors.primaryBlue),
      ),
    ),
  );
}
