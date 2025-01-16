import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';

abstract class ProjectsRepository {
  Future<List<ProjectsEntities>> getProjects();
}
