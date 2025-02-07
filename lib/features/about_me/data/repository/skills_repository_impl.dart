import 'package:Datiego/features/about_me/data/data_source/skills_data_source.dart';

import 'package:Datiego/features/about_me/domain/entities/skill_entities.dart';
import 'package:Datiego/features/about_me/domain/repository/skills_repository.dart';

class SkillsRepositoryImpl implements SkillsRepository {
  final SkillsDataSource dataSource;

  const SkillsRepositoryImpl(this.dataSource);

  @override
  List<SkillsEntities> getSkills() {
    final skills = dataSource.getSkills();

    return skills.map((e) => e.toEntity()).toList();
  }
}
