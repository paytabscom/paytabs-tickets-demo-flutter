import 'package:flutter/material.dart';
import '/presentation/styles/app_colors.dart';

ThemeData getApplicationLightTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      elevation: 2,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      color: AppColors.black,
      elevation: 5,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
