part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetProjectsHomeEvent extends HomeEvent {}

class MouseHoverEvent extends HomeEvent {
  final bool isHovering;

  const MouseHoverEvent(this.isHovering);
}

class SetMouseRegionEvent extends HomeEvent {
  final bool isHovered;

  const SetMouseRegionEvent(this.isHovered);

  @override
  List<Object> get props => [isHovered];
}

class SetHoveredOnItemCardEvent extends HomeEvent {
  final bool isHovered;

  const SetHoveredOnItemCardEvent(this.isHovered);

  @override
  List<Object> get props => [isHovered];
}

class DownloadFileEvent extends HomeEvent {
  final String url;
  final String fileName;

  const DownloadFileEvent({required this.url, required this.fileName});
  @override
  List<Object> get props => [url, fileName];
}
