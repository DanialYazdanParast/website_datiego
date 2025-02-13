import 'package:datiego/core/utils/responsive.dart';
import 'package:flutter/material.dart';

/// ساخت لیست پروژه‌ها با استفاده از یک شبکه (Grid) واکنش‌گرا.
///
/// این تابع یک ویجت `CustomScrollView` برمی‌گرداند که شامل یک شبکه پروژه‌ها است.
/// این شبکه به صورت واکنش‌گرا تنظیم می‌شود و تعداد ستون‌ها و فاصله‌ها بر اساس عرض صفحه محاسبه می‌شوند.
///
/// ## پارامترها:
/// - [controller]: کنترل‌کننده اسکرول برای مدیریت حرکت در صفحه.
/// - [screenWidth]: عرض صفحه برای تنظیمات واکنش‌گرا.
/// - [itemCount]: تعداد آیتم‌ها در شبکه.
/// - [itemBuilder]: تابعی برای ساخت هر آیتم شبکه.
/// - [context]: مرجع ساختار UI برای دسترسی به تنظیمات واکنش‌گرا.
///
/// ## قابلیت‌های کلیدی:
/// - استفاده از `SliverGrid` برای ساخت شبکه پروژه‌ها.
/// - تنظیم تعداد ستون‌ها، فاصله‌ها و نسبت ابعاد آیتم‌ها به صورت واکنش‌گرا.
/// - اضافه کردن حاشیه‌های عمودی و افقی برای زیبایی بصری.
Widget buildProjectList({
  required ScrollController controller,
  required double screenWidth,
  required int itemCount,
  required Widget Function(BuildContext, int) itemBuilder,
  required BuildContext context,
}) {
  return CustomScrollView(
    controller: controller,
    primary: false,
    slivers: <Widget>[
      const SliverPadding(
          padding: EdgeInsets.only(top: 30)), // فاصله بالای صفحه.
      SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context)
              ? screenWidth * 0.08 // حاشیه افقی برای دسکتاپ.
              : screenWidth * 0.05, // حاشیه افقی برای موبایل.
        ),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                Responsive.isDesktop(context) ? 2 : 1, // تعداد ستون‌ها.
            crossAxisSpacing: 32, // فاصله بین ستون‌ها.
            mainAxisSpacing: 32, // فاصله بین ردیف‌ها.
            childAspectRatio: Responsive.isDesktop(context)
                ? 0.9
                : 0.8, // نسبت ابعاد آیتم‌ها.
          ),
          delegate: SliverChildBuilderDelegate(
            itemBuilder, // تابع سازنده هر آیتم.
            childCount: itemCount, // تعداد آیتم‌ها.
          ),
        ),
      ),
      const SliverPadding(
          padding: EdgeInsets.only(top: 120)), // فاصله پایین صفحه.
    ],
  );
}
