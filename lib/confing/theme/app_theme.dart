import 'package:flutter/material.dart';
import 'package:datiego/core/constants/app_colors.dart';

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
  final Color peach;
  final Color purple;
  final Color coral;
  final Color blue;
  final Color green;
  final Color gray;
  final Color skyBlue;
  final Color pink;

  factory MyAppThemeConfig.of(BuildContext context) {
    final brightness = Theme.of(context).colorScheme.brightness;
    return brightness == Brightness.dark
        ? MyAppThemeConfig.dark()
        : MyAppThemeConfig.light();
  }

  MyAppThemeConfig.dark()
      : primaryColor = DarkThemeColors.primaryColor,
        onprimaryColor = DarkThemeColors.onprimaryColor,
        secondaryColor = DarkThemeColors.secondaryColor,
        onsecondaryColor = DarkThemeColors.onsecondaryColor,
        textPrimary = DarkThemeColors.textPrimary,
        borderColor = DarkThemeColors.borderColor,
        dividerColor = DarkThemeColors.dividerColor,
        brightness = Brightness.dark,
        peach = DarkThemeColors.peach,
        purple = DarkThemeColors.purple,
        coral = DarkThemeColors.coral,
        blue = DarkThemeColors.blue,
        green = DarkThemeColors.green,
        skyBlue = DarkThemeColors.skyBlue,
        pink = DarkThemeColors.pink,
        gray = DarkThemeColors.gray,
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
        peach = LightThemeColors.peach,
        purple = LightThemeColors.purple,
        coral = LightThemeColors.coral,
        blue = LightThemeColors.blue,
        green = LightThemeColors.green,
        skyBlue = LightThemeColors.skyBlue,
        pink = LightThemeColors.pink,
        gray = LightThemeColors.gray,
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
