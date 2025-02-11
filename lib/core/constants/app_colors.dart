import 'package:flutter/material.dart';

class LightThemeColors {
  // رنگ‌های اصلی
  static const primaryColor = Color(0xffFFFFFF);
  static const onprimaryColor = Color(0xD6F8F8F8); // شفافیت ۰٫۸۴ (D6)
  static const secondaryColor = Color(0xFFf8f8f8);
  static const onsecondaryColor = Color(0xFFEEEEEE);
  // رنگ‌های متن
  static const textPrimary = Color(0xff212121);
  static const textSecondary = Color(0xff6e6e6e);
  // Border Color
  static const Color borderColor = Color(0x1A000000);
  // Divider Color
  static const Color gray300 = Color(0xB3E0E0E0);
  // Divider Color
  static const Color dividerColor = Color(0xB3E0E0E0);

  // Bottom Color
  static const Color peach = Color(0xFFFAC99C);
  static const Color purple = Color(0xFFC8ADFA);
  static const Color coral = Color(0xFFF8A9A8);
  static const Color blue = Color(0xFF9CCBF5);
  static const Color green = Color(0xFFB0E3B6);
  static const Color gray = Color.fromARGB(255, 227, 224, 150);
  static const Color skyBlue = Color(0xC861BDEE);
  static const Color pink = Color(0xffffb3e9);
}

class DarkThemeColors {
  // رنگ‌های اصلی
  static const primaryColor = Color(0xff101010);
  static const onprimaryColor = Color(0xd6212121); // شفافیت ۰٫۸۴ (D6)
  static const secondaryColor = Color(0xFF181818);
  static const onsecondaryColor = Color(0xFF262626);
  // رنگ‌های متن
  static const textPrimary = Color(0xffffffff);
  static const textSecondary = Color(0xffb3b3b3);
  // Border Color
  static const Color borderColor = Color(0x1affffff);
  // Divider Color
  static const Color dividerColor = Color(0xFF323232);

  // Bottom Color
  static const Color peach = Color(0xFFf69851);
  static const Color purple = Color(0xFF9a63f5);
  static const Color coral = Color(0xFFee7271);
  static const Color blue = Color(0xFF4da7ed);
  static const Color green = Color(0xFF69cc7a);
  static const Color gray = Color.fromARGB(255, 166, 170, 98);
  static const Color skyBlue = Color.fromARGB(255, 52, 119, 196);
  static const Color pink = Color(0xffeb66c8);
}

final List<Color> blogColorsLight = [
  LightThemeColors.blue,
  LightThemeColors.coral,
  LightThemeColors.green,
  LightThemeColors.blue,
  LightThemeColors.pink,
  LightThemeColors.purple,
];

final List<Color> blogColorsDark = [
  DarkThemeColors.blue,
  DarkThemeColors.coral,
  DarkThemeColors.green,
  DarkThemeColors.blue,
  DarkThemeColors.pink,
  DarkThemeColors.purple,
];
