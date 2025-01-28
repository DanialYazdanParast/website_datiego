import 'package:flutter/material.dart';
import 'package:website_datiego/core/di/service_locator.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';
import 'package:website_datiego/features/about_me/domain/entities/skill_entities.dart';
import 'package:website_datiego/features/about_me/domain/use_cases/get_skills_use_case.dart';
import 'package:website_datiego/features/about_me/presentation/widgets/text_titel_about.dart';

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
        color: const Color(0xFFf8f8f8), // معادل background-color
        borderRadius: BorderRadius.circular(32),

        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
          width: 1, // معادل border-width
          style: BorderStyle.solid, // معادل border-style
        ),
      ),
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
          border: customBorder),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 12), // اگر نیاز به فاصله داخلی باشد
        child: Text(
          skill.text, // محتوا
          style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600), // استایل متن
        ),
      ),
    );
  }
}
