import 'package:flutter/material.dart';

/// ساخت یک المان جایگزین (Placeholder) برای شبیه‌سازی بارگذاری.
///
/// ## پارامترها:
/// - [width]: عرض المان.
/// - [height]: ارتفاع المان.
/// - [isDarkMode]: وضعیت تم (تاریک یا روشن).
/// - [borderRadius]: بردر پیش فرض 3
Widget buildPlaceholder(
    {required double width,
    required double height,
    required bool isDarkMode,
    double borderRadius = 3}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: isDarkMode ? Colors.black54 : Colors.white, // رنگ پس‌زمینه.
      borderRadius: BorderRadius.circular(borderRadius), // گردی گوشه‌ها.
    ),
  );
}
