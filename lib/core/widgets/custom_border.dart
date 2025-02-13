import 'package:flutter/material.dart';

/// این تابع یک `Border` سفارشی ایجاد می‌کند که از رنگ outline تم (Theme) برنامه استفاده می‌کند.
///
/// [context] برای دسترسی به تم (Theme) و رنگ‌های برنامه استفاده می‌شود.
///
/// مثال استفاده:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     border: customBorder(context),
///   ),
///   child: Text('متن داخل Container'),
/// );
/// ```
Border customBorder(BuildContext context) {
  return Border.all(
    color: Theme.of(context).colorScheme.outline, // استفاده از رنگ outline تم
    width: 1, // ضخامت حاشیه
    style: BorderStyle.solid, // نوع حاشیه (خط پیوسته)
  );
}
