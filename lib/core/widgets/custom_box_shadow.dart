import 'package:flutter/widgets.dart';

/// این تابع یک لیست از `BoxShadow` سفارشی ایجاد می‌کند که می‌تواند برای ایجاد سایه‌های زیبا در ویجت‌ها استفاده شود.
///
/// این سایه‌ها شامل سه لایه با تنظیمات زیر هستند:
/// 1. سایه اول: رنگ سیاه با شفافیت 4%، شعاع محو 4 پیکسل و بدون جابه‌جایی.
/// 2. سایه دوم: رنگ سیاه با شفافیت 4%، شعاع محو 16 پیکسل و جابه‌جایی 4 پیکسل به پایین.
/// 3. سایه سوم: رنگ سیاه با شفافیت 4%، شعاع محو 32 پیکسل و جابه‌جایی 8 پیکسل به پایین.
///
/// مثال استفاده:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     boxShadow: customBoxShadow,
///   ),
///   child: Text('متن داخل Container'),
/// );
/// ```
List<BoxShadow> get customBoxShadow {
  return [
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04), // رنگ سایه با شفافیت 4%
      blurRadius: 4, // شعاع محو 4 پیکسل
      offset: Offset(0, 0), // بدون جابه‌جایی
    ),
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04), // رنگ سایه با شفافیت 4%
      blurRadius: 16, // شعاع محو 16 پیکسل
      offset: Offset(0, 4), // جابه‌جایی 4 پیکسل به پایین
    ),
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04), // رنگ سایه با شفافیت 4%
      blurRadius: 32, // شعاع محو 32 پیکسل
      offset: Offset(0, 8), // جابه‌جایی 8 پیکسل به پایین
    ),
  ];
}
