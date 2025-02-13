// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:datiego/core/services/url_launcher_service.dart';
import 'package:datiego/core/widgets/code_block_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

/// یک ویجت برای نمایش توضیحات (Description) به صورت HTML.
///
/// این ویجت از پکیج `flutter_html` برای نمایش محتوای HTML استفاده می‌کند.
/// همچنین از `CodeBlockExtension` برای نمایش بلوک‌های کد با هایلایت سینتکس و
/// `UrlLauncherService` برای باز کردن لینک‌ها استفاده می‌کند.
///
/// پارامترها:
/// - [description]: متن HTML که باید نمایش داده شود.
///
/// مثال استفاده:
/// ```dart
/// DescriptionWidget(
///   description: '<p>این یک متن <a href="https://example.com">لینک‌دار</a> است.</p>',
/// );
/// ```
class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    // دریافت سرویس UrlLauncherService از GetIt
    final urlLauncher = GetIt.instance<UrlLauncherService>();

    // بررسی تم تاریک یا روشن
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;

    return Html(
      data: description, // محتوای HTML برای نمایش
      onLinkTap: (url, attributes, element) {
        // باز کردن لینک‌ها با استفاده از UrlLauncherService
        if (url != null) {
          urlLauncher.openUrl(url);
        }
      },
      extensions: [
        // افزودن اکستنشن سفارشی برای نمایش بلوک‌های کد
        CodeBlockExtension(
          isDarkMode: isDarkMode,
        ),
      ],
    );
  }
}
