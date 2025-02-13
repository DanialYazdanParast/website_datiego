import 'package:datiego/features/about_me/domain/entities/skill_entities.dart';

/// مدل مهارت
///
/// این کلاس برای تبدیل داده‌های منتقل شده از API (DTO) به موجودیت‌های (Entities) داخلی استفاده می‌شود.
class SkillModel extends SkillsEntities {
  // سازنده مدل که ویژگی‌های `text` و `colorCode` را از کلاس والد (`SkillsEntities`) می‌گیرد.
  SkillModel({required super.text, required super.colorCode});

  // تبدیل مدل به موجودیت (Entity)
  SkillsEntities toEntity() {
    return SkillsEntities(
      text: text,
      colorCode: colorCode,
    );
  }
}
