import 'package:datiego/core/utils/exceptions.dart';
import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/domain/use_cases/get_blog_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

/// بلاک وبلاگ که وضعیت‌های مختلف وبلاگ را مدیریت می‌کند.
class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetBlogUsecase getBlogUsecase;

  /// سازنده بلاک وبلاگ که از [GetBlogUsecase] استفاده می‌کند.
  BlogBloc(this.getBlogUsecase) : super(BlogLoadingState()) {
    // رویداد [GetBlogEvent] برای بارگذاری وبلاگ‌ها
    on<GetBlogEvent>((event, emit) async {
      // تغییر وضعیت به حالت در حال بارگذاری
      emit(BlogLoadingState());
      await Future.delayed(const Duration(milliseconds: 500));

      try {
        // فراخوانی usecase برای دریافت وبلاگ‌ها
        final result = await getBlogUsecase.call();
        // ارسال وضعیت موفقیت‌آمیز با لیست وبلاگ‌ها
        emit(BlogSuccesState(result));
      } catch (e) {
        // در صورت وقوع خطا، ارسال وضعیت خطا
        emit(BlogErrorState(exception: AppException()));
      }
    });
  }
}
