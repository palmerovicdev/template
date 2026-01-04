import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.light.bgDark,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.light.highlight,
      surface: AppColors.light.bg,
      primaryContainer: AppColors.light.bg,
      onPrimaryContainer: AppColors.light.text,
      outline: AppColors.light.border,
      shadow: Colors.black.withOpacity(0.1),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.light.text,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.light.text),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.light.text),
      bodyMedium: TextStyle(color: AppColors.light.text),
      bodySmall: TextStyle(color: AppColors.light.text),
    ),
    iconTheme: IconThemeData(color: AppColors.light.text),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        iconColor: AppColors.light.text,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.light.text,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.light.textMuted,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.dark.bgDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.dark.highlight,
      surface: AppColors.dark.bg,
      primaryContainer: AppColors.dark.bg,
      onPrimaryContainer: AppColors.dark.text,
      outline: AppColors.dark.border,
      shadow: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.dark.text,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.dark.text),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.dark.text),
      bodyMedium: TextStyle(color: AppColors.dark.text),
      bodySmall: TextStyle(color: AppColors.dark.text),
    ),
    iconTheme: IconThemeData(color: AppColors.dark.text),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.dark.text,
        textStyle: TextStyle(color: AppColors.dark.text, fontWeight: FontWeight.bold),
        iconColor: AppColors.dark.text,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.dark.textMuted),
    ),
  );
}
