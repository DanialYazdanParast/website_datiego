import 'package:Datiego/features/about_me/domain/entities/skill_entities.dart';

abstract class SkillsRepository {
  List<SkillsEntities> getSkills();
}
