import 'package:datiego/features/about_me/data/data_source/skills_data_source.dart';
import 'package:datiego/features/about_me/domain/entities/skill_entities.dart';
import 'package:datiego/features/about_me/domain/repository/skills_repository.dart';

/// پیاده‌سازی مخزن مهارت‌ها
///
/// این کلاس مسئول ارائه داده‌های مهارت‌ها از منبع داده و تبدیل آن‌ها به موجودیت‌ها است.
class SkillsRepositoryImpl implements SkillsRepository {
  final SkillsDataSource dataSource;

  /// سازنده‌ای که منبع داده (DataSource) را دریافت می‌کند.
  const SkillsRepositoryImpl(this.dataSource);

  @override
  List<SkillsEntities> getSkills() {
    // دریافت لیست مهارت‌ها از منبع داده
    final skills = dataSource.getSkills();

    // تبدیل مدل‌ها به موجودیت‌ها و بازگشت لیست موجودیت‌ها
    return skills.map((e) => e.toEntity()).toList();
  }
}
