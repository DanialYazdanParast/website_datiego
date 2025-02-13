import 'package:datiego/features/blog/domain/entities/blog_entities.dart';

/// اینترفیس برای دسترسی به داده‌های وبلاگ
/// تعریف متدهایی که باید در کلاس‌های مربوطه پیاده‌سازی شوند
abstract class BlogRepository {
  /// دریافت فهرست وبلاگ‌ها
  /// این متد باید اطلاعات وبلاگ‌ها را از منبع داده (مانند API یا دیتابیس) دریافت کند
  Future<List<BlogEntities>> getBlogs();
}
