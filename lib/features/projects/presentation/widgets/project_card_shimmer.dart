import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:datiego/core/widgets/custom_border.dart';

/// ویجت کارت پروژه شیمیر (Shimmer).
///
/// این ویجت یک کارت پروژه را به صورت انیمیشن شیمیر نمایش می‌دهد.
/// این انیمیشن برای شبیه‌سازی بارگذاری داده‌ها در حالت بارگذاری استفاده می‌شود.
/// طراحی واکنش‌گرا و استفاده از انیمیشن‌های ظریف، تجربه کاربری را بهبود می‌بخشد.
class ProjectCardShimmer extends StatelessWidget {
  /// سازنده کلاس [ProjectCardShimmer].
  const ProjectCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // تشخیص حالت تم (تاریک یا روشن) برای تنظیمات رنگی.
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24), // فاصله داخلی کارت.
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, // رنگ پس‌زمینه کارت.
        borderRadius: BorderRadius.circular(32), // گردی گوشه‌ها.
        border: customBorder(context), // حاشیه سفارشی.
      ),
      child: Shimmer.fromColors(
        baseColor: isDarkMode
            ? Colors.grey[700]!
            : Colors.grey[300]!, // رنگ پایه شیمیر.
        highlightColor: isDarkMode
            ? Colors.grey[500]!
            : Colors.grey[100]!, // رنگ برجسته شیمیر.
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // هم‌ترازی المان‌ها از سمت چپ.
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // فضای خالی بین المان‌ها.
          children: [
            Expanded(
              child: _buildPlaceholder(
                  width: double.infinity,
                  height: 150,
                  isDarkMode: isDarkMode), // تصویر.
            ),
            const SizedBox(height: 16), // فاصله عمودی.
            _buildPlaceholder(
                width: 150, height: 24, isDarkMode: isDarkMode), // عنوان.
            const SizedBox(height: 16), // فاصله عمودی.
            _buildPlaceholder(
                width: double.infinity,
                height: 16,
                isDarkMode: isDarkMode), // توضیحات.
            const SizedBox(height: 16), // فاصله عمودی.
            Wrap(
              spacing: 8.0, // فاصله افقی بین تگ‌ها.
              runSpacing: 4.0, // فاصله عمودی بین ردیف‌ها.
              children: List.generate(3, (index) {
                return _buildPlaceholder(
                    width: 80, height: 30, isDarkMode: isDarkMode); // تگ‌ها.
              }),
            ),
          ],
        ),
      ),
    )
        .animate() // اضافه کردن انیمیشن.
        .slideY(
          begin: 0.2, // شروع از موقعیت پایین‌تر.
          end: 0, // پایان در موقعیت عادی.
          duration: const Duration(milliseconds: 500), // مدت زمان انیمیشن.
          curve: Curves.easeOut, // منحنی انیمیشن.
        )
        .fadeIn(); // ظهور تدریجی.
  }

  /// ساخت یک المان جایگزین (Placeholder) برای شبیه‌سازی بارگذاری.
  ///
  /// ## پارامترها:
  /// - [width]: عرض المان.
  /// - [height]: ارتفاع المان.
  /// - [isDarkMode]: وضعیت تم (تاریک یا روشن).
  Widget _buildPlaceholder({
    required double width,
    required double height,
    required bool isDarkMode,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black54 : Colors.white, // رنگ پس‌زمینه.
        borderRadius: BorderRadius.circular(8), // گردی گوشه‌ها.
      ),
    );
  }
}
