import 'package:flutter/material.dart';
import 'package:datiego/features/home/presentation/bloc/home_bloc.dart';
import 'package:datiego/features/home/presentation/widgets/item_card_home.dart';

/// ساخت کارت‌های آیتم برای صفحه اصلی.
///
/// این تابع یک ویجت برمی‌گرداند که شامل کارت‌های آیتم است که در حالت موفقیت (HomeSuccesState) نمایش داده می‌شوند.
/// هر کارت به صورت واکنش‌گرا و با استفاده از موقعیت‌ها، زوایا و اندازه‌های مشخص شده قرار می‌گیرد.
///
/// ## پارامترها:
/// - [state]: حالت فعلی BLoC که شامل لیست پروژه‌ها است.
/// - [width]: عرض صفحه برای تنظیمات واکنش‌گرا.
/// - [height]: ارتفاع صفحه برای تنظیمات واکنش‌گرا.
///
/// ## خروجی:
/// - اگر حالت `HomeSuccesState` باشد، یک ویجت `Positioned` که شامل کارت‌های آیتم است برمی‌گرداند.
/// - در غیر این صورت، یک ویجت خالی (`SizedBox.shrink`) برمی‌گرداند.
Widget buildItemCards(
  HomeState state,
  double width,
  double height,
) {
  if (state is HomeSuccesState) {
    return Positioned(
      child: SizedBox(
        height: 600, // ارتفاع ثابت برای کارت‌ها.
        width: 800, // عرض ثابت برای کارت‌ها.
        child: Stack(
          children: state.projects.take(5).map((project) {
            final index = state.projects.indexOf(project);
            return ItemCardHome(
              project: project, // داده‌های پروژه.
              width: width, // عرض صفحه برای تنظیمات واکنش‌گرا.
              height: height, // ارتفاع صفحه برای تنظیمات واکنش‌گرا.
              alignmentx: _getAlignmentX(index), // موقعیت افقی کارت.
              alignmenty: _getAlignmentY(index), // موقعیت عمودی کارت.
              angle: _getAngle(index), // زاویه چرخش کارت.
            );
          }).toList(),
        ),
      ),
    );
  }
  return const SizedBox
      .shrink(); // در صورت عدم وجود حالت موفقیت، ویجت خالی برمی‌گرداند.
}

/// محاسبه موقعیت افقی کارت بر اساس اندیس.
///
/// این تابع یک لیست از مقادیر از پیش تعریف شده را برای موقعیت‌های افقی کارت‌ها استفاده می‌کند.
double _getAlignmentX(int index) {
  const alignmentX = [0.55, -0.95, 0.05, 0.99, -0.7];
  return alignmentX[index];
}

/// محاسبه موقعیت عمودی کارت بر اساس اندیس.
///
/// این تابع یک لیست از مقادیر از پیش تعریف شده را برای موقعیت‌های عمودی کارت‌ها استفاده می‌کند.
double _getAlignmentY(int index) {
  const alignmentY = [-0.82, 0.60, 0.85, 0.5, -0.70];
  return alignmentY[index];
}

/// محاسبه زاویه چرخش کارت بر اساس اندیس.
///
/// این تابع یک لیست از مقادیر از پیش تعریف شده را برای زوایای چرخش کارت‌ها استفاده می‌کند.
double _getAngle(int index) {
  const angles = [0.06, 0.05, -0.05, 0.08, -0.08];
  return angles[index];
}
