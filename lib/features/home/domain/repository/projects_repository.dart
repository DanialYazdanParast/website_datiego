import 'package:website_datiego/features/home/domain/entities/projects_entities.dart';

abstract class ProjectsRepository {
  Future<List<ProjectsEntities>> getProjects();
}
