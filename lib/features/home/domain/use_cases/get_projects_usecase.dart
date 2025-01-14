import 'package:website_datiego/features/home/domain/entities/projects_entities.dart';
import 'package:website_datiego/features/home/domain/repository/projects_repository.dart';

class GetProjectsUsecase {
  final ProjectsRepository projectsRepository;

  const GetProjectsUsecase(this.projectsRepository);

  Future<List<ProjectsEntities>> call() async {
    return await projectsRepository.getProjects();
  }
}
