part of 'projects_bloc.dart';

abstract class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object> get props => [];
}

class GetProjectsEvent extends ProjectsEvent {}

class HoverItemEvent extends ProjectsEvent {
  final int index;
  final bool isHovered;

  const HoverItemEvent(this.index, this.isHovered);

  @override
  // TODO: implement props
  List<Object> get props => [index, isHovered];
}
