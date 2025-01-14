import 'package:dio/dio.dart';

abstract class ProjectsRemoteDataSource {
  Future<dynamic> getProjects();
}

class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  final Dio _dio;
  const ProjectsRemoteDataSourceImpl(this._dio);

  @override
  Future<dynamic> getProjects() async {
    var response = await _dio.get(
      'collections/projects/records',
    );

    return response;
  }
}
