import 'package:bloc_test/bloc_test.dart';
import 'package:datiego/features/home/domain/use_cases/download_file_usecase.dart';
import 'package:datiego/features/home/presentation/bloc/home_bloc.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:datiego/features/shared/domain/use_cases/get_projects_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetProjectsUsecase, DownloadFileUseCase])
void main() {
  late MockGetProjectsUsecase mockGetProjectsUsecase;
  late MockDownloadFileUseCase mockDownloadFileUseCase;

  setUp(() {
    mockGetProjectsUsecase = MockGetProjectsUsecase();
    mockDownloadFileUseCase = MockDownloadFileUseCase();
  });

  group(
    'Home bloc ',
    () {
      blocTest<HomeBloc, HomeState>(
        'should emit [HomeLoadingState, HomeSuccesState] when GetProjectsHomeEvent is added',
        build: () {
          when(mockGetProjectsUsecase.call()).thenAnswer((_) async {
            return <ProjectsEntities>[]; // بازگرداندن لیست خالی
          });
          return HomeBloc(mockGetProjectsUsecase, mockDownloadFileUseCase);
        },
        act: (bloc) => bloc.add(GetProjectsHomeEvent()),
        expect: () => [
          isA<HomeLoadingState>(), // بررسی emit شدن state loading
          isA<HomeSuccesState>(),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'should emit [HomeSuccesState] when SetMouseRegionEvent is added',
        build: () {
          final bloc =
              HomeBloc(mockGetProjectsUsecase, mockDownloadFileUseCase);
          bloc.emit(const HomeSuccesState([],
              hoveredOnItemCard: false,
              mouseRegion: false)); // انتشار مقدار اولیه
          return bloc;
        },
        act: (bloc) => bloc.add(const SetMouseRegionEvent(true)),
        expect: () => [
          isA<HomeSuccesState>(),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'should emit [HomeLoadingState, HomeErrorState] when GetProjectsHomeEvent is added and an error occurs',
        build: () {
          // شبیه‌سازی خطا در فراخوانی getProjectsUsecase.call()
          when(mockGetProjectsUsecase.call())
              .thenThrow(Exception('Failed to load projects'));
          return HomeBloc(mockGetProjectsUsecase, mockDownloadFileUseCase);
        },
        act: (bloc) => bloc.add(GetProjectsHomeEvent()),
        expect: () => [
          isA<HomeLoadingState>(), // بررسی emit شدن state loading
          isA<HomeErrorState>(), // بررسی emit شدن state error
        ],
      );
    },
  );
}
