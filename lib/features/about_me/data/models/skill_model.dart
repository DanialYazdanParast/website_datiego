import 'package:Datiego/features/about_me/domain/entities/skill_entities.dart';

class SkillModel {
  final String text;
  final int colorCode;

  SkillModel({required this.text, required this.colorCode});

  // تبدیل DTO به Entity
  SkillsEntities toEntity() {
    return SkillsEntities(
      text: text,
      colorCode: colorCode,
    );
  }
}
