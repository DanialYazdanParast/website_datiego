import 'package:equatable/equatable.dart';

/// مدل داده‌ای وبلاگ
/// نمایانگر اطلاعات پایه‌ای هر وبلاگ در سیستم
class BlogEntities extends Equatable {
  final String title; // عنوان وبلاگ
  final String subtitle; // زیرعنوان وبلاگ
  final String image; // URL تصویر نمایشی وبلاگ
  final String description; // توضیحات کامل وبلاگ
  final String id; // شناسه منحصر به فرد وبلاگ

  const BlogEntities({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.id,
  });

  /// مقایسه‌ای آسان با استفاده از `Equatable`
  /// مقایسه به این صورت انجام می‌شود که در صورت برابر بودن هرکدام از فیلدها
  /// این شی‌ء برابر با شی‌ء دیگر در نظر گرفته می‌شود
  @override
  List<Object?> get props => [title, subtitle, image, description, id];
}
