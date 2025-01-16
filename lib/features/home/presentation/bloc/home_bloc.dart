import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:website_datiego/core/utils/exceptions.dart';
import 'package:website_datiego/features/home/domain/use_cases/download_file_usecase%20.dart';
import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';

import 'package:website_datiego/features/shared/domain/use_cases/get_projects_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProjectsUsecase getProjectsUsecase;
  final DownloadFileUseCase downloadFileUseCase;

  HomeBloc(this.getProjectsUsecase, this.downloadFileUseCase)
      : super(HomeLoadingState()) {
    on<GetProjectsHomeEvent>((event, emit) async {
      try {
        var projects = await getProjectsUsecase.call();
        emit(HomeSuccesState(projects));
      } catch (e) {
        emit(HomeErrorState(exception: AppException()));
      }
    });

    on<SetMouseRegionEvent>((event, emit) {
      if (state is HomeSuccesState) {
        final currentState = state as HomeSuccesState;
        emit(currentState.copyWith(mouseRegion: event.isHovered));
      }
    });

    on<SetHoveredOnItemCardEvent>((event, emit) {
      if (state is HomeSuccesState) {
        final currentState = state as HomeSuccesState;
        emit(currentState.copyWith(hoveredOnItemCard: event.isHovered));
      }
    });

    on<DownloadFileEvent>((event, emit) async {
      await downloadFileUseCase.call(event.url, event.fileName);
    });
  }
}
