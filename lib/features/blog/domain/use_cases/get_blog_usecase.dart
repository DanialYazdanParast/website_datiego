import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/domain/repository/blog_repository.dart';

class GetBlogUsecase {
  final BlogRepository repository;

  const GetBlogUsecase(this.repository);

  Future<List<BlogEntities>> call() async {
    return await repository.getBlogs();
  }
}
