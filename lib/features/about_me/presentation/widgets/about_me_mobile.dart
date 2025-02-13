import 'package:datiego/features/about_me/presentation/widgets/profile_details_widget.dart';
import 'package:datiego/features/about_me/presentation/widgets/profile_intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// صفحه "درباره من" برای نمایش در دستگاه‌های موبایل.
///
/// این صفحه شامل دو بخش اصلی است:
/// - **بخش معرفی پروفایل**: که شامل اطلاعات ابتدایی پروفایل است.
/// - **بخش جزئیات پروفایل**: که اطلاعات تکمیلی درباره پروفایل را نمایش می‌دهد.
///
/// ## مثال استفاده:
/// ```dart
/// const AboutMeMobile(scrollController: scrollController, width: width)
/// ```
///
/// ## نکات:
/// - از انیمیشن `slideY` و `fadeIn` برای ایجاد تاثیرات جذاب در هنگام بارگذاری استفاده شده است.
/// - از `SingleChildScrollView` برای اجازه دادن به اسکرول صفحه استفاده می‌شود.
class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({
    super.key,
    required this.scrollController,
    required this.width,
  });

  final ScrollController scrollController; // کنترلر اسکرول برای بخش اسکرول‌پذیر
  final double width; // عرض صفحه نمایش

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility:
          false, // نوار اسکرول فقط زمانی نمایش داده می‌شود که اسکرول فعال باشد
      trackVisibility: false, // مسیر اسکرول نمایش داده نمی‌شود
      thickness: 10, // ضخامت نوار اسکرول
      radius: const Radius.circular(10), // شعاع گوشه‌های نوار اسکرول
      child: SingleChildScrollView(
        controller: scrollController, // مدیریت اسکرول صفحه
        child: Padding(
          padding: EdgeInsets.only(
            top: 30, // فاصله از بالا
            bottom: 120, // فاصله از پایین
            left: width * 0.05, // فاصله از چپ
            right: width * 0.05, // فاصله از راست
          ),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 24, // فاصله پایین برای پروفایل اینترو
                ),
                child: ProfileIntroWidget(), // ویجت معرفی پروفایل
              ),
              ProfileDetailsWidget(), // ویجت جزئیات پروفایل
            ],
          )
              .animate() // انیمیشن برای حرکت و ظاهر شدن
              .slideY(
                  begin: 0.2, // شروع از پایین
                  end: 0, // پایان در موقعیت اصلی
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut)
              .fadeIn(), // انیمیشن ظاهر شدن
        ),
      ),
    );
  }
}
