import 'package:flutter/material.dart';
import 'package:datiego/core/widgets/custom_border.dart';

/// یک ویجت برای نمایش لیستی از تگ‌ها به صورت افقی و چیدمان آن‌ها در صورت نیاز به خط بعدی.
///
/// این ویجت از [Wrap] برای چیدمان تگ‌ها استفاده می‌کند و در صورت کمبود فضا، تگ‌ها به خط بعدی منتقل می‌شوند.
/// هر تگ در یک [Container] با استایل خاصی نمایش داده می‌شود که شامل رنگ پس‌زمینه، حاشیه‌های گرد و یک حاشیه سفارشی است.
///
/// ## مثال استفاده:
///
/// ```dart
/// TagProject(
///   tag: ['Flutter', 'Dart', 'Mobile', 'UI'],
/// )
/// ```
///
/// ## پارامترها:
///
/// - `tag`: لیستی از رشته‌ها که تگ‌ها را نشان می‌دهند.
///
/// ## نکات:
///
/// - از [Theme.of(context)] برای دریافت رنگ‌ها و استایل‌های متن استفاده می‌شود.
/// - فاصله بین تگ‌ها به صورت افقی (`spacing`) و عمودی (`runSpacing`) قابل تنظیم است.
///
/// ## استایل‌ها:
///
/// - رنگ پس‌زمینه تگ‌ها از `Theme.of(context).colorScheme.onSecondary` گرفته می‌شود.
/// - متن تگ‌ها با استایل `titleMedium` و اندازه فونت ۱۴ و وزن ۴۰۰ نمایش داده می‌شود.
/// - حاشیه‌های گرد با شعاع ۸ پیکسل و یک حاشیه سفارشی (`customBorder`) اعمال می‌شود.
///
/// ## وابستگی‌ها:
///
/// - این ویجت از ویجت `customBorder` از مسیر `package:datiego/core/widgets/custom_border.dart` استفاده می‌کند.
///
///
/// این ویجت برای نمایش تگ‌های پروژه در یک رابط کاربری زیبا و کاربرپسند مناسب است.
class TagProject extends StatelessWidget {
  const TagProject({
    super.key,
    required this.tag,
  });

  /// لیست تگ‌هایی که باید نمایش داده شوند.
  final List<String> tag;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // فاصله افقی بین تگ‌ها
      runSpacing: 4.0, // فاصله عمودی بین خطوط تگ‌ها
      children: tag.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary, // رنگ پس‌زمینه تگ
            borderRadius: BorderRadius.circular(8), // حاشیه‌های گرد
            border: customBorder(context), // حاشیه سفارشی
          ),
          child: Text(
            tag,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400, // وزن فونت
                  fontSize: 14, // اندازه فونت
                ),
          ),
        );
      }).toList(),
    );
  }
}
