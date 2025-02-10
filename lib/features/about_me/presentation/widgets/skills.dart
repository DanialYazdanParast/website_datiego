import 'package:flutter/material.dart';
import 'package:datiego/core/di/service_locator.dart';
import 'package:datiego/core/widgets/custom_border.dart';
import 'package:datiego/features/about_me/domain/entities/skill_entities.dart';
import 'package:datiego/features/about_me/domain/use_cases/get_skills_use_case.dart';
import 'package:datiego/features/about_me/presentation/widgets/text_titel_about.dart';

class Skills extends StatelessWidget {
  Skills({
    super.key,
  });
  final List<SkillsEntities> skills = GetSkillsUseCase(getIt.get()).call();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.secondary, // معادل background-color
          borderRadius: BorderRadius.circular(32),
          border: customBorder(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitelAbout(
            text: "Skills",
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((skill) => SkillCard(skill: skill)).toList(),
          )
        ],
      ),
    );
  }
}

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
          color: Color(skill.colorCode), // معادل background-color
          borderRadius: BorderRadius.circular(8), // معادل border-radius
          border: customBorder(context)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 12), // اگر نیاز به فاصله داخلی باشد
        child: Text(
          skill.text, // محتوا
          style: const TextStyle(fontSize: 16, color: Colors.black),
          // استایل متن
        ),
      ),
    );
  }
}
