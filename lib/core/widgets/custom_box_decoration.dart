import 'package:flutter/material.dart';
import 'package:datiego/core/widgets/custom_border.dart';

/// این تابع یک `BoxDecoration` سفارشی ایجاد می‌کند که شامل رنگ پس‌زمینه، شعاع حاشیه و یک حاشیه سفارشی است.
///
/// [context] برای دسترسی به تم (Theme) و رنگ‌های برنامه استفاده می‌شود.
///
/// مثال استفاده:
/// ```dart
/// Container(
///   decoration: customBoxDecoration(context),
///   child: Text('متن داخل Container'),
/// );
/// ```
BoxDecoration customBoxDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context)
        .colorScheme
        .secondary, // رنگ پس‌زمینه (معادل background-color)
    borderRadius: BorderRadius.circular(32), // شعاع حاشیه (32 پیکسل)
    border: customBorder(context), // حاشیه سفارشی
  );
}
