import 'package:datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:datiego/features/shared/domain/repository/projects_repository.dart';

/// UseCase برای دریافت لیست پروژه‌ها.
///
/// این کلاس یک لایه انتزاعی بین منطق تجاری و مخزن (Repository) ایجاد می‌کند.
/// با استفاده از این UseCase، عملیات دریافت لیست پروژه‌ها به صورت جداگانه و قابل مدیریت پیاده‌سازی می‌شود.
class GetProjectsUsecase {
  /// مخزن مرتبط با پروژه‌ها.
  final ProjectsRepository projectsRepository;

  /// سازنده کلاس [GetProjectsUsecase].
  ///
  /// - [projectsRepository]: مخزنی که عملیات دریافت پروژه‌ها را انجام می‌دهد.
  const GetProjectsUsecase(this.projectsRepository);

  /// فراخوانی عملیات دریافت لیست پروژه‌ها.
  ///
  /// ## بازگشت:
  /// لیستی از شیءهای `ProjectsEntities` که شامل اطلاعات پروژه‌ها است.
  Future<List<ProjectsEntities>> call() async {
    // فراخوانی متد دریافت پروژه‌ها از مخزن.
    return await projectsRepository.getProjects();
  }
}
