import 'package:datiego/features/about_me/domain/entities/skill_entities.dart';

/// مخزن مهارت‌ها
///
/// این اینترفیس مسئول دریافت مهارت‌ها از منابع مختلف (مانند دیتابیس، API و غیره) است.
/// پیاده‌سازی‌های مختلف می‌توانند این اینترفیس را برای منابع داده مختلف پیاده‌سازی کنند.
abstract class SkillsRepository {
  /// دریافت لیست مهارت‌ها
  ///
  /// این متد لیستی از مهارت‌ها را به عنوان موجودیت (Entities) باز می‌گرداند.
  List<SkillsEntities> getSkills();
}
