import 'package:flutter/material.dart';
import 'package:website_datiego/core/constants/app_colors.dart';

class MyAppThemeConfig {
  final Color primaryColor;
  final Color onprimaryColor;
  final Color secondaryColor;
  final Color onsecondaryColor;
  final Color textPrimary;
  final Color textSecondary;
  final Color borderColor;
  final Color dividerColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryColor = DarkThemeColors.primaryColor,
        onprimaryColor = DarkThemeColors.onprimaryColor,
        secondaryColor = DarkThemeColors.secondaryColor,
        onsecondaryColor = DarkThemeColors.onsecondaryColor,
        textPrimary = DarkThemeColors.textPrimary,
        borderColor = DarkThemeColors.borderColor,
        dividerColor = DarkThemeColors.dividerColor,
        brightness = Brightness.dark,
        textSecondary = DarkThemeColors.textSecondary;

  MyAppThemeConfig.light()
      : primaryColor = LightThemeColors.primaryColor,
        onprimaryColor = LightThemeColors.onprimaryColor,
        secondaryColor = LightThemeColors.secondaryColor,
        onsecondaryColor = LightThemeColors.onsecondaryColor,
        textPrimary = LightThemeColors.textPrimary,
        borderColor = LightThemeColors.borderColor,
        dividerColor = LightThemeColors.dividerColor,
        brightness = Brightness.light,
        textSecondary = LightThemeColors.textSecondary;

  ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: primaryColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconTheme: IconThemeData(
        color: textPrimary,
      ),
      dividerColor: dividerColor,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: primaryColor,
        secondary: secondaryColor,
        onSecondary: onsecondaryColor,
        primary: primaryColor,
        onPrimary: onprimaryColor,
        onSurface: textPrimary,
        outline: borderColor,
      ),
    );
  }
}
