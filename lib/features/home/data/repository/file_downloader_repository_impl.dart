import 'package:datiego/features/home/domain/repository/file_downloader_repository.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// پیاده‌سازی رابط `FileDownloaderRepository` برای دانلود فایل.
///
/// این کلاس یک پیاده‌سازی ملموس از رابط `FileDownloaderRepository` است که عملیات دانلود فایل را با استفاده از عناصر HTML انجام می‌دهد.
/// این پیاده‌سازی مناسب برای برنامه‌های Flutter Web است.
class FileDownloaderRepositoryImpl implements FileDownloaderRepository {
  @override
  Future<void> downloadFile(String url, String fileName) async {
    // ایجاد یک عنصر HTML برای دانلود فایل
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank' // باز شدن لینک در یک تب جدید
      ..download = fileName; // نام فایل در زمان دانلود

    // شبیه‌سازی کلیک روی لینک برای شروع دانلود
    anchor.click();

    // حذف عنصر بعد از استفاده برای تمیز کردن DOM
    anchor.remove();
  }
}
