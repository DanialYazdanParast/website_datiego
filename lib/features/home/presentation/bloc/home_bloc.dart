import 'package:bloc/bloc.dart';
import 'package:datiego/features/home/domain/use_cases/download_file_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:datiego/core/utils/exceptions.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:datiego/features/shared/domain/use_cases/get_projects_usecase.dart';
part 'home_event.dart';
part 'home_state.dart';

/// بلوک مدیریت حالت‌ها و رویدادهای مرتبط با صفحه اصلی.
///
/// این کلاس از `Bloc` برای مدیریت حالت‌ها و رویدادهای مرتبط با صفحه اصلی استفاده می‌کند.
/// شامل عملیات‌هایی مانند دریافت پروژه‌ها، تنظیم وضعیت ماوس، و دانلود فایل است.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// UseCase برای دریافت لیست پروژه‌ها.
  final GetProjectsUsecase getProjectsUsecase;

  /// UseCase برای دانلود فایل.
  final DownloadFileUseCase downloadFileUseCase;

  /// سازنده کلاس [HomeBloc].
  ///
  /// - [getProjectsUsecase]: UseCase برای دریافت پروژه‌ها.
  /// - [downloadFileUseCase]: UseCase برای دانلود فایل.
  HomeBloc(this.getProjectsUsecase, this.downloadFileUseCase)
      : super(HomeInitialState()) {
    /// مدیریت رویداد دریافت پروژه‌ها.
    on<GetProjectsHomeEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        // دریافت لیست پروژه‌ها از طریق UseCase.
        var projects = await getProjectsUsecase.call();
        // معکوس کردن ترتیب پروژه‌ها برای نمایش از جدیدترین به قدیمی‌ترین.
        var reversed = projects.reversed.toList();
        // انتشار حالت موفقیت آمیز با لیست پروژه‌ها.
        emit(HomeSuccesState(reversed));
      } catch (e) {
        // انتشار حالت خطا در صورت بروز مشکل.
        emit(HomeErrorState(exception: AppException()));
      }
    });

    /// مدیریت رویداد تنظیم وضعیت ماوس در منطقه خاصی.
    on<SetMouseRegionEvent>((event, emit) {
      if (state is HomeSuccesState) {
        // دریافت حالت فعلی.
        final currentState = state as HomeSuccesState;
        // انتشار حالت جدید با به‌روزرسانی وضعیت ماوس.
        emit(currentState.copyWith(mouseRegion: event.isHovered));
      }
    });

    /// مدیریت رویداد تنظیم وضعیت هاور بر روی کارت‌ها.
    on<SetHoveredOnItemCardEvent>((event, emit) {
      if (state is HomeSuccesState) {
        // دریافت حالت فعلی.
        final currentState = state as HomeSuccesState;
        // انتشار حالت جدید با به‌روزرسانی وضعیت هاور.
        emit(currentState.copyWith(hoveredOnItemCard: event.isHovered));
      }
    });

    /// مدیریت رویداد دانلود فایل.
    on<DownloadFileEvent>((event, emit) async {
      // فراخوانی UseCase برای دانلود فایل.
      await downloadFileUseCase.call(event.url, event.fileName);
    });
  }
}
