import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:website_datiego/core/utils/exceptions.dart';
import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:website_datiego/features/shared/domain/use_cases/get_projects_usecase.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetProjectsUsecase getProjectsUsecase;
  ProjectsBloc(this.getProjectsUsecase) : super(ProjectLoadingState()) {
    on<GetProjectsEvent>((event, emit) async {
      try {
        var projects = await getProjectsUsecase.call();
        emit(ProjectSuccesState(projects));
      } catch (e) {
        emit(ProjectErrorState(AppException()));
      }
    });

    on<HoverItemEvent>((event, emit) {
      if (state is ProjectSuccesState) {
        final currentState = state as ProjectSuccesState;
        final updatedHoveredItems =
            Map<int, bool>.from(currentState.hoveredItems)
              ..[event.index] = event.isHovered;

        emit(currentState.copyWith(hoveredItems: updatedHoveredItems));
      }
    });
  }
}
