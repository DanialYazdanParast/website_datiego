import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/domain/repository/blog_repository.dart';

/// کلاس Usecase برای دریافت وبلاگ‌ها
/// این کلاس مسئول فراخوانی متدهای مربوط به منبع داده (Repository) است.
class GetBlogUsecase {
  /// ریپازیتوری که از آن داده‌ها دریافت می‌شود
  final BlogRepository repository;

  /// سازنده که یک شی از `BlogRepository` را دریافت می‌کند
  const GetBlogUsecase(this.repository);

  /// متد `call` که از ریپازیتوری وبلاگ‌ها را دریافت می‌کند
  ///
  /// این متد عملیات دریافت وبلاگ‌ها را انجام می‌دهد و نتیجه را برمی‌گرداند.
  Future<List<BlogEntities>> call() async {
    return await repository.getBlogs();
  }
}
