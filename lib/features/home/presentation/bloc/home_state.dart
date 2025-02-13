part of 'home_bloc.dart';

/// کلاس پایه برای حالت‌های مرتبط با `HomeBloc`.
///
/// این کلاس یک کلاس انتزاعی (abstract) است که تمام حالت‌های مرتبط با `HomeBloc` را شامل می‌شود.
/// هر حالت نماینده وضعیت فعلی بلوک است و از `Equatable` برای مقایسه حالت‌ها استفاده می‌کند.
abstract class HomeState extends Equatable {
  /// سازنده پایه برای کلاس [HomeState].
  const HomeState();

  @override
  List<Object> get props => [];
}

/// حالت بارگذاری داده‌ها.
///
/// این حالت زمانی ارسال می‌شود که داده‌ها در حال بارگذاری هستند.
class HomeLoadingState extends HomeState {}

/// حالت موفقیت آمیز بارگذاری داده‌ها.
///
/// این حالت زمانی ارسال می‌شود که داده‌ها با موفقیت بارگذاری شده‌اند.
///
/// ## پارامترها:
/// - [projects]: لیست پروژه‌های دریافتی.
/// - [mouseRegion]: وضعیت ماوس در منطقه خاصی (در صورتی که ماوس در منطقه باشد، مقدار `true` است).
/// - [hoveredOnItemCard]: وضعیت هاور بر روی کارت‌ها (در صورتی که ماوس بر روی کارت باشد، مقدار `true` است).
class HomeSuccesState extends HomeState {
  final List<ProjectsEntities> projects;
  final bool mouseRegion; // وضعیت MouseRegion
  final bool hoveredOnItemCard; // وضعیت Hover روی کارت‌ها

  /// سازنده کلاس [HomeSuccesState].
  ///
  /// - [projects]: لیست پروژه‌های دریافتی.
  /// - [mouseRegion]: وضعیت ماوس در منطقه خاصی.
  /// - [hoveredOnItemCard]: وضعیت هاور بر روی کارت‌ها.
  const HomeSuccesState(
    this.projects, {
    this.mouseRegion = false,
    this.hoveredOnItemCard = false,
  });

  /// ایجاد یک کپی از حالت فعلی با مقادیر جدید.
  ///
  /// این متد برای به‌روزرسانی حالت فعلی بدون تغییر مستقیم آن استفاده می‌شود.
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
  List<Object> get props => [
        projects,
        mouseRegion,
        hoveredOnItemCard
      ]; // مقایسه حالت بر اساس این مقادیر.
}

/// حالت خطای بارگذاری داده‌ها.
///
/// این حالت زمانی ارسال می‌شود که در فرآیند بارگذاری داده‌ها خطایی رخ دهد.
///
/// ## پارامترها:
/// - [exception]: خطا (Exception) رخ داده.
class HomeErrorState extends HomeState {
  final AppException exception;

  /// سازنده کلاس [HomeErrorState].
  ///
  /// - [exception]: خطا (Exception) رخ داده.
  const HomeErrorState({required this.exception});

  @override
  List<Object> get props => [exception]; // مقایسه حالت بر اساس خطا.
}
