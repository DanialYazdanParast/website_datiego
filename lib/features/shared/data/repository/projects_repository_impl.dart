import 'package:website_datiego/core/utils/response_validator.dart';
import 'package:website_datiego/features/shared/data/data_source/remote/projects_remote_data_source.dart';

import 'package:website_datiego/features/shared/data/models/projects_models.dart';
import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:website_datiego/features/shared/domain/repository/projects_repository.dart';

class ProjectsRepositoryImpl extends ProjectsRepository
    with HttpResponseValidat {
  ProjectsRemoteDataSource remoteDataSource;
  ProjectsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProjectsEntities>> getProjects() async {
    var response = await remoteDataSource.getProjects();

    validatResponse(response);
    return response.data['items']
        .map<ProjectsModels>(
            (jsonObject) => ProjectsModels.fromJson(jsonObject))
        .toList();
  }
}
