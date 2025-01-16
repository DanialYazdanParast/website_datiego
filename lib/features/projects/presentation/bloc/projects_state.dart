part of 'projects_bloc.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object> get props => [];
}

class ProjectLoadingState extends ProjectsState {}

class ProjectSuccesState extends ProjectsState {
  final List<ProjectsEntities> projects;
  final Map<int, bool> hoveredItems; // وضعیت آیتم‌های Hover

  const ProjectSuccesState(this.projects, {this.hoveredItems = const {}});

  ProjectSuccesState copyWith({
    List<ProjectsEntities>? projects,
    Map<int, bool>? hoveredItems,
  }) {
    return ProjectSuccesState(
      projects ?? this.projects,
      hoveredItems: hoveredItems ?? this.hoveredItems,
    );
  }

  @override
  List<Object> get props => [projects, hoveredItems];
}

class ProjectErrorState extends ProjectsState {
  final AppException exception;
  const ProjectErrorState(this.exception);
  @override
  List<Object> get props => [exception];
}
