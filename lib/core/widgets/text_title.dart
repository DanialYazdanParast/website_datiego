import 'package:flutter/material.dart';

/// ویجتی برای نمایش عنوان با استایل پیش‌فرض.
///
/// ## مثال استفاده:
/// ```dart
/// TextTitle(
///   title: 'این یک عنوان نمونه است.',
/// )
/// ```
///
/// ## پارامترها:
/// - `title`: متن عنوان.
///
/// ## نکات:
/// - استایل متن از `Theme.of(context).textTheme.titleLarge` گرفته می‌شود.
class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
