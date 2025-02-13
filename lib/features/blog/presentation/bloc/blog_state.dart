part of 'blog_bloc.dart';

/// کلاس پایه وضعیت‌های بلاک وبلاگ
///
/// از این کلاس برای مدیریت وضعیت‌های مختلف وبلاگ استفاده می‌شود.
abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

/// وضعیت در حال بارگذاری وبلاگ
///
/// این وضعیت هنگام بارگذاری داده‌ها نشان داده می‌شود.
class BlogLoadingState extends BlogState {}

/// وضعیت موفقیت‌آمیز دریافت داده‌های وبلاگ
///
/// وقتی داده‌ها با موفقیت دریافت شوند، این وضعیت به همراه لیست وبلاگ‌ها ارسال می‌شود.
class BlogSuccesState extends BlogState {
  final List<BlogEntities> blogs;
  const BlogSuccesState(this.blogs);

  @override
  List<Object> get props => [blogs];
}

/// وضعیت خطا در هنگام دریافت داده‌های وبلاگ
///
/// اگر مشکلی در دریافت داده‌ها رخ دهد، این وضعیت همراه با جزئیات خطا ارسال می‌شود.
class BlogErrorState extends BlogState {
  final AppException exception;
  const BlogErrorState({required this.exception});

  @override
  List<Object> get props => [exception];
}
