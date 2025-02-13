import 'package:datiego/core/utils/response_validator.dart';
import 'package:datiego/features/blog/data/data_source/blog_data_source_remote.dart';
import 'package:datiego/features/blog/data/models/blog_models.dart';
import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/domain/repository/blog_repository.dart';

/// پیاده‌سازی رابط `BlogRepository` برای مدیریت داده‌های مربوط به وبلاگ.
///
/// این کلاس از `BlogDataSourceRemote` برای دریافت داده‌ها از منبع داده‌های دور (مانند API) استفاده می‌کند.
/// همچنین از `HttpResponseValidat` برای اعتبارسنجی پاسخ‌های دریافتی استفاده می‌شود.
///
/// ## مثال استفاده:
/// ```dart
/// final blogRepository = BlogRepositoryImpl(remoteDataSource);
/// final blogs = await blogRepository.getBlogs();
/// ```
///
/// ## نکات:
/// - `getBlogs` داده‌های وبلاگ را از طریق `remoteDataSource` دریافت می‌کند.
/// - پاسخ دریافتی با استفاده از `validatResponse` اعتبارسنجی می‌شود.
/// - داده‌های دریافتی به لیستی از `BlogModels` تبدیل می‌شوند.
/// - `BlogModels` به عنوان `BlogEntities` بازگردانده می‌شود.
class BlogRepositoryImpl extends BlogRepository with HttpResponseValidat {
  final BlogDataSourceRemote remoteDataSource;

  BlogRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<BlogEntities>> getBlogs() async {
    var response =
        await remoteDataSource.getBlogs(); // دریافت داده‌ها از منبع دور
    validatResponse(response); // اعتبارسنجی پاسخ
    return response.data['items']
        .map<BlogModels>((jsonObject) =>
            BlogModels.fromJson(jsonObject)) // تبدیل JSON به مدل
        .toList(); // تبدیل به لیست
  }
}
