import 'package:datiego/core/utils/response_validator.dart';
import 'package:datiego/features/blog/data/data_source/blog_data_source_remote.dart';
import 'package:datiego/features/blog/data/models/blog_models.dart';
import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/domain/repository/blog_repository.dart';

class BlogRepositoryImpl extends BlogRepository with HttpResponseValidat {
  final BlogDataSourceRemote remoteDataSource;

  BlogRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<BlogEntities>> getBlogs() async {
    var response = await remoteDataSource.getBlogs();
    validatResponse(response);
    return response.data['items']
        .map<BlogModels>((jsonObject) => BlogModels.fromJson(jsonObject))
        .toList();
  }
}
