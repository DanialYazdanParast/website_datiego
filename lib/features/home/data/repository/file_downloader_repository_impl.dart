import 'package:website_datiego/features/home/domain/repository/file_downloader_repository.dart';

import 'dart:html' as html;

class FileDownloaderRepositoryImpl implements FileDownloaderRepository {
  @override
  Future<void> downloadFile(String url, String fileName) async {
    //   ایجاد یک عنصر HTML برای دانلود فایل
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank' // باز شدن لینک در یک تب جدید
      ..download = fileName; // نام فایل در زمان دانلود
    anchor.click(); // شبیه‌سازی کلیک روی لینک
    anchor.remove(); // حذف عنصر بعد از استفاده
  }
}
