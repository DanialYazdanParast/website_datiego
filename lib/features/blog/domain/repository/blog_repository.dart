import 'package:Datiego/features/blog/domain/entities/blog_entities.dart';

abstract class BlogRepository {
  Future<List<BlogEntities>> getBlogs();
}
