part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogLoadingState extends BlogState {}

class BlogSuccesState extends BlogState {
  final List<BlogEntities> blogs;
  const BlogSuccesState(this.blogs);

  @override
  List<Object> get props => [blogs];
}

class BlogErrorState extends BlogState {
  final AppException exception;
  const BlogErrorState({required this.exception});
  @override
  List<Object> get props => [exception];
}
