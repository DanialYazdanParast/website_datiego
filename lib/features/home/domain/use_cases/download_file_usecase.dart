import 'package:datiego/features/home/domain/repository/file_downloader_repository.dart';

/// UseCase برای دانلود فایل.
///
/// این کلاس یک لایه انتزاعی بین منطق تجاری و مخزن (Repository) ایجاد می‌کند.
/// با استفاده از این UseCase، عملیات دانلود فایل به صورت جداگانه و قابل مدیریت پیاده‌سازی می‌شود.
class DownloadFileUseCase {
  /// مخزن مرتبط با دانلود فایل.
  final FileDownloaderRepository repository;

  /// سازنده کلاس [DownloadFileUseCase].
  ///
  /// - [repository]: مخزنی که عملیات دانلود فایل را انجام می‌دهد.
  DownloadFileUseCase(this.repository);

  /// فراخوانی عملیات دانلود فایل.
  ///
  /// ## پارامترها:
  /// - [url]: آدرس URL فایل برای دانلود.
  /// - [fileName]: نام فایل برای ذخیره در دستگاه.
  ///
  /// ## استثناها:
  /// - ممکن است خطاهایی مانند عدم دسترسی به اینترنت یا مشکلات مربوط به مخزن رخ دهد.
  Future<void> call(String url, String fileName) async {
    // فراخوانی متد دانلود فایل از مخزن.
    await repository.downloadFile(url, fileName);
  }
}
