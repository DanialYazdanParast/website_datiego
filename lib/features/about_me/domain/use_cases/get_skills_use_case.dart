import 'package:datiego/features/about_me/domain/entities/skill_entities.dart';
import 'package:datiego/features/about_me/domain/repository/skills_repository.dart';

/// مورد استفاده برای دریافت لیست مهارت‌ها
///
/// این کلاس مسئول دریافت اطلاعات مهارت‌ها از مخزن داده است.
/// متد `call()` برای استفاده آسان به‌صورت تابعی طراحی شده است.
class GetSkillsUseCase {
  final SkillsRepository repository;
  const GetSkillsUseCase(this.repository);

  /// متد برای دریافت لیست مهارت‌ها از مخزن
  List<SkillsEntities> call() => repository.getSkills();
}
