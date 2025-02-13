import 'package:flutter/material.dart';

/// ویجت ریسپانسیو برای نمایش محتوای مختلف در دستگاه‌های موبایل و دسکتاپ
class Responsive extends StatelessWidget {
  /// ویجت مخصوص موبایل
  final Widget mobile;

  /// ویجت مخصوص دسکتاپ
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile, // ویجت موبایل
    required this.desktop, // ویجت دسکتاپ
  });

  /// بررسی موبایل بودن دستگاه
  ///
  /// اگر عرض صفحه کمتر از 900 پیکسل باشد، دستگاه موبایل در نظر گرفته می‌شود.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;

  /// بررسی دسکتاپ بودن دستگاه
  ///
  /// اگر عرض صفحه برابر یا بیشتر از 900 پیکسل باشد، دستگاه دسکتاپ در نظر گرفته می‌شود.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // اگر دستگاه دسکتاپ باشد، ویجت دسکتاپ نمایش داده می‌شود
        if (Responsive.isDesktop(context)) {
          return desktop;
        } else {
          // در غیر این صورت ویجت موبایل نمایش داده می‌شود
          return mobile;
        }
      },
    );
  }
}
