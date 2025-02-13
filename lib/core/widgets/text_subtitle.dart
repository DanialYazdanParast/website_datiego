import 'package:flutter/material.dart';

/// ویجتی برای نمایش زیرعنوان با قابلیت محدود کردن تعداد خطوط و اضافه کردن `...` در صورت نیاز.
///
/// ## مثال استفاده:
/// ```dart
/// TextSubtitle(
///   subtitle: 'این یک زیرعنوان نمونه است.',
///   maxLines: 2, // اختیاری (پیش‌فرض: ۱)
/// )
/// ```
///
/// ## پارامترها:
/// - `subtitle`: متن زیرعنوان.
/// - `maxLines`: حداکثر تعداد خطوط (پیش‌فرض: ۱).
///
/// ## نکات:
/// - از `TextOverflow.ellipsis` برای نمایش `...` در صورت اضافه بودن متن استفاده می‌شود.
/// - استایل متن از `Theme.of(context).textTheme.titleMedium` گرفته می‌شود.
class TextSubtitle extends StatelessWidget {
  const TextSubtitle({
    super.key,
    required this.subtitle,
    this.maxLines = 1,
  });

  final String subtitle;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.titleMedium,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
