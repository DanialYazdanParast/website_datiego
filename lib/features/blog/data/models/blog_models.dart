import 'package:datiego/core/constants/app_constants.dart';
import 'package:datiego/features/blog/domain/entities/blog_entities.dart';

/// مدل وبلاگ برای تبدیل داده‌ها از فرمت JSON به شی
/// این کلاس از `BlogEntities` ارث‌بری می‌کند و مسئول تبدیل داده‌ها به مدل‌های قابل استفاده در اپلیکیشن است.
class BlogModels extends BlogEntities {
  const BlogModels({
    required super.title,
    required super.subtitle,
    required super.image,
    required super.description,
    required super.id,
  });

  /// فاکتوری برای ساخت شی `BlogModels` از داده‌های JSON
  /// این متد به عنوان یک مبدل (converter) عمل می‌کند که داده‌ها را از فرمت JSON به مدل شی تبدیل می‌کند.
  factory BlogModels.fromJson(Map<String, dynamic> json) {
    return BlogModels(
      title: json['title'],
      subtitle: json['subtitle'],
      image: '${AppConstants.baseUrl}files/blog/${json['id']}/${json['image']}',
      description: json['description'],
      id: json['id'],
    );
  }
}
