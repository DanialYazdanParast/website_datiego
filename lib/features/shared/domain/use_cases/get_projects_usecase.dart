import 'package:datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:datiego/features/shared/domain/repository/projects_repository.dart';

class GetProjectsUsecase {
  final ProjectsRepository projectsRepository;

  const GetProjectsUsecase(this.projectsRepository);

  Future<List<ProjectsEntities>> call() async {
    return await projectsRepository.getProjects();
  }
}
