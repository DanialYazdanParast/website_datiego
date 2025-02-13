import 'package:datiego/features/shared/domain/entities/projects_entities.dart';

/// رابط (Interface) برای مخزن پروژه‌ها.
///
/// این کلاس یک رابط انتزاعی است که عملیات مربوط به دریافت لیست پروژه‌ها را تعریف می‌کند.
/// هر پیاده‌سازی از این رابط باید متد `getProjects` را پیاده‌سازی کند.
abstract class ProjectsRepository {
  /// دریافت لیست پروژه‌ها.
  ///
  /// ## بازگشت:
  /// لیستی از شیءهای `ProjectsEntities` که شامل اطلاعات پروژه‌ها است.
  Future<List<ProjectsEntities>> getProjects();
}
