import 'package:Datiego/features/about_me/domain/entities/skill_entities.dart';
import 'package:Datiego/features/about_me/domain/repository/skills_repository.dart';

class GetSkillsUseCase {
  final SkillsRepository repository;
  const GetSkillsUseCase(this.repository);

  List<SkillsEntities> call() => repository.getSkills();
}
