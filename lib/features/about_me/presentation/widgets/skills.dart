import 'package:flutter/material.dart';
import 'package:datiego/core/di/service_locator.dart';
import 'package:datiego/core/widgets/custom_border.dart';
import 'package:datiego/features/about_me/domain/entities/skill_entities.dart';
import 'package:datiego/features/about_me/domain/use_cases/get_skills_use_case.dart';
import 'package:datiego/features/about_me/presentation/widgets/text_titel_about.dart';

/// ویجت مهارت‌ها
///
/// این ویجت برای نمایش مهارت‌های مختلف کاربر طراحی شده است. مهارت‌ها از طریق `GetSkillsUseCase` بارگذاری می‌شوند.
/// ویجت شامل یک جعبه با حاشیه و رنگ پس‌زمینه است که به صورت افقی (Wrap) نمایش داده می‌شوند.
///
/// ## نکات:
/// - از `SkillCard` برای نمایش هر مهارت به صورت جداگانه استفاده می‌شود.
class Skills extends StatelessWidget {
  Skills({
    super.key,
  });

  // دریافت لیست مهارت‌ها از `GetSkillsUseCase`
  final List<SkillsEntities> skills = GetSkillsUseCase(getIt.get()).call();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(32),
          border: customBorder(context)), // طراحی جعبه با حاشیه
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitelAbout(
            text: "Skills", // عنوان بخش مهارت‌ها
          ),
          const SizedBox(
            height: 16,
          ),
          // نمایش مهارت‌ها به صورت افقی با فاصله مشخص
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((skill) => SkillCard(skill: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

/// ویجت کارت مهارت
///
/// این ویجت برای نمایش هر مهارت به صورت جداگانه و در قالب یک کارت طراحی شده است.
/// هر کارت شامل رنگ پس‌زمینه، متن مهارت و حاشیه است.
///
/// ## نکات:
/// - رنگ پس‌زمینه هر کارت با استفاده از کد رنگ موجود در `skill.colorCode` تنظیم می‌شود.
class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.skill,
  });

  final SkillsEntities skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(skill.colorCode), // رنگ پس‌زمینه بر اساس کد رنگ
        borderRadius: BorderRadius.circular(8), // تنظیم گوشه‌های گرد
        border: customBorder(context), // حاشیه با استفاده از `customBorder`
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 12), // فاصله داخلی کارت
        child: Text(
          skill.text, // نمایش متن مهارت
          style:
              const TextStyle(fontSize: 16, color: Colors.black), // استایل متن
        ),
      ),
    );
  }
}
