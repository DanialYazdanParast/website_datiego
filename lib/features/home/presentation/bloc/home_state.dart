part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {}

class HomeSuccesState extends HomeState {
  final List<ProjectsEntities> projects;
  final bool mouseRegion; // وضعیت MouseRegion
  final bool hoveredOnItemCard; // وضعیت Hover روی کارت‌ها

  const HomeSuccesState(
    this.projects, {
    this.mouseRegion = false,
    this.hoveredOnItemCard = false,
  });

  HomeSuccesState copyWith({
    bool? mouseRegion,
    bool? hoveredOnItemCard,
    List<ProjectsEntities>? projects,
  }) {
    return HomeSuccesState(
      projects ?? this.projects,
      mouseRegion: mouseRegion ?? this.mouseRegion,
      hoveredOnItemCard: hoveredOnItemCard ?? this.hoveredOnItemCard,
    );
  }

  @override
  List<Object> get props => [projects, mouseRegion, hoveredOnItemCard];
}

class HomeErrorState extends HomeState {
  final AppException exception;
  const HomeErrorState({required this.exception});
  @override
  List<Object> get props => [exception];
}
