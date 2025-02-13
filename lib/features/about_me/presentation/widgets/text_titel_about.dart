import 'package:flutter/material.dart';

/// ویجت عنوان برای بخش "درباره من"
///
/// این ویجت به طور خاص برای نمایش عنوان‌ها در صفحه "درباره من" طراحی شده است.
/// از `text` برای دریافت متن و نمایش آن استفاده می‌کند.
///
/// ## نکات:
/// - از `Theme.of(context).textTheme.titleLarge` برای تعیین سبک متن استفاده شده است.
class TextTitelAbout extends StatelessWidget {
  final String text;

  const TextTitelAbout({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge, // استفاده از استایل عنوان
    );
  }
}
