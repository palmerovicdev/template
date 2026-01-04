import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_constants.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.light.bgDark,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.light.bgDark,
      onSurface: AppColors.light.text,
      onSurfaceVariant: AppColors.light.textMuted,
      primaryContainer: AppColors.light.bg,
      onPrimaryContainer: AppColors.light.text,
      outline: AppColors.light.border,
      shadow: Colors.black.withAlpha(10),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.light.text,
      titleTextStyle: TextStyle(fontSize: AppConstants.remX2, fontWeight: FontWeight.bold, color: AppColors.light.text),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.light.text),
      bodyMedium: TextStyle(color: AppColors.light.text),
      bodySmall: TextStyle(color: AppColors.light.text),
    ),
    iconTheme: IconThemeData(color: AppColors.light.text),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.light.text,
        textStyle: TextStyle(color: AppColors.light.text),
        iconColor: AppColors.light.text,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.remX15),
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.light.text,
      selectionColor: AppColors.light.borderMuted.withAlpha(50),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.light.bg,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppConstants.remX15, vertical: AppConstants.remX15),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.light.textMuted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.remX15),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.dark.bgDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.dark.bgDark,
      onSurface: AppColors.dark.text,
      onSurfaceVariant: AppColors.dark.textMuted,
      primaryContainer: AppColors.dark.bg,
      onPrimaryContainer: AppColors.dark.text,
      outline: AppColors.dark.border,
      shadow: Colors.black.withAlpha(10),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.dark.text,
      titleTextStyle: TextStyle(fontSize: AppConstants.remX2, fontWeight: FontWeight.bold, color: AppColors.dark.text),
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
        foregroundColor: AppColors.light.text,
        textStyle: TextStyle(color: AppColors.light.text),
        iconColor: AppColors.light.text,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.remX15),
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.dark.text,
      selectionColor: AppColors.dark.borderMuted.withAlpha(50),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.dark.bg,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppConstants.remX15, vertical: AppConstants.remX15),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.remX15),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.dark.textMuted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.remX15),
        ),
      ),
    ),
  );
}
