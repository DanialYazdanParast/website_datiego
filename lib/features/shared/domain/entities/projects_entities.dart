import 'package:equatable/equatable.dart';

/// مدل داده‌ای برای نمایش اطلاعات پروژه.
///
/// این کلاس یک موجودیت (Entity) است که اطلاعات مربوط به یک پروژه را شامل می‌شود.
/// از `Equatable` برای مقایسه شیءها بر اساس مقادیر داخلی استفاده می‌کند.
class ProjectsEntities extends Equatable {
  /// توضیحات پروژه.
  final String? description;

  /// آدرس تصویر پروژه.
  final String? image;

  /// زیرعنوان پروژه.
  final String? subtitle;

  /// عنوان پروژه.
  final String? title;

  /// شناسه منحصر به فرد پروژه.
  final String? id;

  /// لیست تگ‌های مرتبط با پروژه.
  final List<String>? tag;

  /// لینک GitHub پروژه.
  final String? gitHubLink;

  /// سازنده کلاس [ProjectsEntities].
  ///
  /// - [description]: توضیحات پروژه.
  /// - [image]: آدرس تصویر پروژه.
  /// - [subtitle]: زیرعنوان پروژه.
  /// - [title]: عنوان پروژه.
  /// - [id]: شناسه منحصر به فرد پروژه.
  /// - [tag]: لیست تگ‌های مرتبط با پروژه.
  /// - [gitHubLink]: لینک GitHub پروژه.
  const ProjectsEntities({
    this.description,
    this.image,
    this.subtitle,
    this.title,
    this.id,
    this.tag,
    this.gitHubLink,
  });

  @override
  List<Object?> get props => [
        description,
        image,
        subtitle,
        title,
        id,
        tag,
        gitHubLink
      ]; // مقایسه شیء بر اساس این مقادیر.
}
