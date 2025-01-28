import 'package:website_datiego/features/about_me/domain/entities/skill_entities.dart';

abstract class SkillsRepository {
  List<SkillsEntities> getSkills();
}
