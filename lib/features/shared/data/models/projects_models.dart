import 'package:datiego/core/constants/app_constants.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';

/// مدل داده‌ای برای تبدیل داده‌های JSON به شیء پروژه.
///
/// این کلاس یک مدل (Model) است که از `ProjectsEntities` ارث‌بری می‌کند و برای تبدیل داده‌های JSON به شیء پروژه استفاده می‌شود.
/// شامل یک سازنده فکتوری (`fromJson`) برای پارس کردن داده‌های JSON و تبدیل آن‌ها به شیء پروژه.
class ProjectsModels extends ProjectsEntities {
  /// سازنده کلاس [ProjectsModels].
  ///
  /// - [description]: توضیحات پروژه.
  /// - [image]: آدرس تصویر پروژه.
  /// - [subtitle]: زیرعنوان پروژه.
  /// - [title]: عنوان پروژه.
  /// - [id]: شناسه منحصر به فرد پروژه.
  /// - [tag]: لیست تگ‌های مرتبط با پروژه.
  /// - [gitHubLink]: لینک GitHub پروژه.
  const ProjectsModels({
    super.description,
    super.image,
    super.subtitle,
    super.title,
    super.id,
    super.tag,
    super.gitHubLink,
  });

  /// تبدیل داده‌های JSON به شیء پروژه.
  ///
  /// این متد داده‌های JSON را دریافت می‌کند و آن‌ها را به شیء پروژه تبدیل می‌کند.
  ///
  /// ## پارامترها:
  /// - [json]: داده‌های JSON که شامل اطلاعات پروژه است.
  ///
  /// ## بازگشت:
  /// یک شیء از نوع `ProjectsModels` که شامل اطلاعات پروژه است.
  factory ProjectsModels.fromJson(Map<String, dynamic> json) {
    return ProjectsModels(
      description: json['Description'] ?? '', // توضیحات پروژه (اختیاری).
      image:
          '${AppConstants.baseUrl}files/projects/${json['id']}/${json['Image']}', // آدرس تصویر پروژه.
      subtitle: json['Subtitle'] ?? '', // زیرعنوان پروژه (اختیاری).
      title: json['Title'] ?? '', // عنوان پروژه (اختیاری).
      id: json['id'] ?? '', // شناسه منحصر به فرد پروژه (اختیاری).
      tag: json['tag'] != null
          ? List<String>.from(
              json['expand']['tag'].map((tag) => tag['name'] as String))
          : [], // لیست تگ‌ها (اختیاری).
      gitHubLink: json['gitHubLink'] ?? '', // لینک GitHub پروژه (اختیاری).
    );
  }
}
