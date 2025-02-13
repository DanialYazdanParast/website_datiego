import 'package:flutter/material.dart';

/// **🎨 رنگ‌های تم روشن (Light Theme Colors)**
/// این کلاس شامل رنگ‌های مورد استفاده در حالت روشن اپلیکیشن است.
class LightThemeColors {
  // 🌟 رنگ‌های اصلی
  static const primaryColor = Color(0xffFFFFFF); // رنگ اصلی پس‌زمینه
  static const onprimaryColor = Color(0xD6F8F8F8); // رنگ روی پس‌زمینه اصلی
  static const secondaryColor = Color(0xFFf8f8f8); // رنگ پس‌زمینه ثانویه
  static const onsecondaryColor = Color(0xFFEEEEEE); // رنگ روی پس‌زمینه ثانویه

  // 📝 رنگ‌های متن
  static const textPrimary = Color(0xff212121); // رنگ متن اصلی
  static const textSecondary = Color(0xff6e6e6e); // رنگ متن ثانویه

  // 🔳 رنگ‌های خطوط و جداکننده‌ها
  static const Color borderColor = Color(0x1A000000); // رنگ مرزها
  static const Color gray300 =
      Color(0xB3E0E0E0); // رنگ خاکستری (استفاده شده برای جداکننده‌ها)
  static const Color dividerColor = Color(0xB3E0E0E0); // رنگ خط جداکننده

  // 🎨 رنگ‌های استفاده شده در دکمه‌ها و بخش‌های مختلف
  static const Color peach = Color(0xFFFAC99C);
  static const Color purple = Color(0xFFC8ADFA);
  static const Color coral = Color(0xFFF8A9A8);
  static const Color blue = Color(0xFF9CCBF5);
  static const Color green = Color(0xFFB0E3B6);
  static const Color gray = Color.fromARGB(255, 227, 224, 150);
  static const Color skyBlue = Color(0xC861BDEE);
  static const Color pink = Color(0xffffb3e9);
}

/// **🌙 رنگ‌های تم تاریک (Dark Theme Colors)**
/// این کلاس شامل رنگ‌های مورد استفاده در حالت تاریک اپلیکیشن است.
class DarkThemeColors {
  // 🌟 رنگ‌های اصلی
  static const primaryColor = Color(0xff101010); // رنگ اصلی پس‌زمینه
  static const onprimaryColor = Color(0xd6212121); // رنگ روی پس‌زمینه اصلی
  static const secondaryColor = Color(0xFF181818); // رنگ پس‌زمینه ثانویه
  static const onsecondaryColor = Color(0xFF262626); // رنگ روی پس‌زمینه ثانویه

  // 📝 رنگ‌های متن
  static const textPrimary = Color(0xffffffff); // رنگ متن اصلی (سفید)
  static const textSecondary =
      Color(0xffb3b3b3); // رنگ متن ثانویه (خاکستری روشن)

  // 🔳 رنگ‌های خطوط و جداکننده‌ها
  static const Color borderColor = Color(0x1affffff); // رنگ مرزها
  static const Color dividerColor = Color(0xFF323232); // رنگ خط جداکننده

  // 🎨 رنگ‌های استفاده شده در دکمه‌ها و بخش‌های مختلف
  static const Color peach = Color(0xFFf69851);
  static const Color purple = Color(0xFF9a63f5);
  static const Color coral = Color(0xFFee7271);
  static const Color blue = Color(0xFF4da7ed);
  static const Color green = Color(0xFF69cc7a);
  static const Color gray = Color.fromARGB(255, 227, 224, 150);
  static const Color skyBlue = Color.fromARGB(255, 52, 119, 196);
  static const Color pink = Color(0xffeb66c8);
}

/// **📝 لیست رنگ‌های مورد استفاده برای وبلاگ در تم روشن**
final List<Color> blogColorsLight = [
  LightThemeColors.blue,
  LightThemeColors.coral,
  LightThemeColors.green,
  LightThemeColors.blue,
  LightThemeColors.pink,
  LightThemeColors.purple,
];

/// **📝 لیست رنگ‌های مورد استفاده برای وبلاگ در تم تاریک**
final List<Color> blogColorsDark = [
  DarkThemeColors.blue,
  DarkThemeColors.coral,
  DarkThemeColors.green,
  DarkThemeColors.blue,
  DarkThemeColors.pink,
  DarkThemeColors.purple,
];
