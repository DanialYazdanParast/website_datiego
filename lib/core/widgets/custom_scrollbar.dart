import 'package:datiego/core/utils/responsive.dart';
import 'package:flutter/material.dart';

/// ویجت اسکرول‌بار سفارشی با پشتیبانی از نمایش در دسکتاپ.
///
/// 📌 **ویژگی‌ها:**
/// ✅ نمایش **شست و مسیر اسکرول** فقط در دسکتاپ
/// ✅ تنظیم **ضخامت اسکرول‌بار** (۱۰ در دسکتاپ، ۷ در موبایل)
/// ✅ گوشه‌های **گرد با شعاع ۱۰ پیکسل**
///
/// **نحوه استفاده:**
/// ```dart
/// CustomScrollbar(
///   controller: scrollController,
///   child: ListView(...),
/// )
/// ```
class CustomScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController controller;

  const CustomScrollbar({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      thumbVisibility: Responsive.isDesktop(context),
      trackVisibility: Responsive.isDesktop(context),
      thickness: Responsive.isDesktop(context) ? 10 : 7,
      radius: const Radius.circular(0),
      child: child,
    );
  }
}
