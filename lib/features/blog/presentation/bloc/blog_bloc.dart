import 'package:datiego/core/utils/exceptions.dart';
import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/domain/use_cases/get_blog_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetBlogUsecase getBlogUsecase;
  BlogBloc(this.getBlogUsecase) : super(BlogLoadingState()) {
    on<GetBlogEvent>((event, emit) async {
      emit(BlogLoadingState());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        final result = await getBlogUsecase.call();
        emit(BlogSuccesState(result));
      } catch (e) {
        emit(BlogErrorState(exception: AppException()));
      }
    });
  }
}
