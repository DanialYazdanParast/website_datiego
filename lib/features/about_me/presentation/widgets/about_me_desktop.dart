import 'package:datiego/features/about_me/presentation/widgets/profile_details_widget.dart';
import 'package:datiego/features/about_me/presentation/widgets/profile_intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// صفحه "درباره من" برای نمایش در دستگاه‌های دسکتاپ.
///
/// این صفحه شامل دو بخش اصلی است:
/// - **بخش ثابت سمت چپ**: که شامل معرفی کلی پروفایل است.
/// - **بخش اسکرول‌پذیر سمت راست**: که جزئیات بیشتر درباره پروفایل را نمایش می‌دهد.
///
/// ## مثال استفاده:
/// ```dart
/// const AboutMeDesktop(scrollController: scrollController, width: width)
/// ```
///
/// ## نکات:
/// - از انیمیشن `slideY` و `fadeIn` برای ایجاد تاثیرات جذاب در هنگام بارگذاری استفاده شده است.
/// - از `Scrollbar` برای کنترل اسکرول و نمایش یک نوار اسکرول تمیز استفاده می‌شود.
///
/// ## ساختار صفحه:
/// 1. **بخش سمت چپ**: پروفایل اینترو (ProfileIntroWidget) با انیمیشن.
/// 2. **بخش سمت راست**: جزئیات پروفایل (ProfileDetailsWidget) که به صورت اسکرول‌پذیر نمایش داده می‌شود.
class AboutMeDesktop extends StatelessWidget {
  const AboutMeDesktop({
    super.key,
    required this.scrollController,
    required this.width,
  });

  final ScrollController scrollController; // کنترلر اسکرول برای بخش اسکرول‌پذیر
  final double width; // عرض صفحه نمایش

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // بخش ثابت سمت چپ
        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 120, left: width * 0.1),
            child: const ProfileIntroWidget()
                .animate()
                .slideY(
                    begin: 0.2, // شروع از پایین
                    end: 0, // پایان در موقعیت اصلی
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut)
                .fadeIn(), // انیمیشن ظاهر شدن
          ),
        ),

        // فاصله بین دو بخش
        const SizedBox(
          width: 24,
        ),

        // بخش اسکرول‌پذیر سمت راست
        Expanded(
          flex: 9,
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true, // نمایش نوار اسکرول
            trackVisibility: true, // نمایش مسیر اسکرول
            thickness: 10, // ضخامت نوار اسکرول
            radius: const Radius.circular(10), // شعاع گوشه‌های نوار اسکرول
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.1, top: 30, bottom: 120),
                    child: const ProfileDetailsWidget()
                        .animate()
                        .slideY(
                            begin: 0.2, // شروع از پایین
                            end: 0, // پایان در موقعیت اصلی
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeOut)
                        .fadeIn(), // انیمیشن ظاهر شدن
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
