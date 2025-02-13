part of 'projects_bloc.dart';

/// کلاس پایه برای حالت‌های مرتبط با `ProjectsBloc`.
///
/// این کلاس یک کلاس انتزاعی (abstract) است که تمام حالت‌های مرتبط با `ProjectsBloc` را شامل می‌شود.
/// هر حالت نماینده وضعیت فعلی بلوک است و از `Equatable` برای مقایسه حالت‌ها استفاده می‌کند.
abstract class ProjectsState extends Equatable {
  /// سازنده پایه برای کلاس [ProjectsState].
  const ProjectsState();

  @override
  List<Object> get props => [];
}

/// حالت بارگذاری داده‌ها.
///
/// این حالت زمانی ارسال می‌شود که داده‌ها در حال بارگذاری هستند.
class ProjectLoadingState extends ProjectsState {}

/// حالت موفقیت آمیز بارگذاری داده‌ها.
///
/// این حالت زمانی ارسال می‌شود که داده‌ها با موفقیت بارگذاری شده‌اند.
///
/// ## پارامترها:
/// - [projects]: لیست پروژه‌های دریافتی.
/// - [hoveredItems]: وضعیت هاور برای هر آیتم پروژه (شاخص آیتم به عنوان کلید و وضعیت هاور به عنوان مقدار).
class ProjectSuccesState extends ProjectsState {
  final List<ProjectsEntities> projects;
  final Map<int, bool> hoveredItems; // وضعیت آیتم‌های Hover

  /// سازنده کلاس [ProjectSuccesState].
  ///
  /// - [projects]: لیست پروژه‌های دریافتی.
  /// - [hoveredItems]: وضعیت هاور برای هر آیتم پروژه.
  const ProjectSuccesState(this.projects, {this.hoveredItems = const {}});

  /// ایجاد یک کپی از حالت فعلی با مقادیر جدید.
  ///
  /// این متد برای به‌روزرسانی حالت فعلی بدون تغییر مستقیم آن استفاده می‌شود.
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
  List<Object> get props => [
        projects,
        hoveredItems
      ]; // مقایسه حالت بر اساس لیست پروژه‌ها و وضعیت هاور.
}

/// حالت خطای بارگذاری داده‌ها.
///
/// این حالت زمانی ارسال می‌شود که در فرآیند بارگذاری داده‌ها خطایی رخ دهد.
///
/// ## پارامترها:
/// - [exception]: خطا (Exception) رخ داده.
class ProjectErrorState extends ProjectsState {
  final AppException exception;

  /// سازنده کلاس [ProjectErrorState].
  ///
  /// - [exception]: خطا (Exception) رخ داده.
  const ProjectErrorState(this.exception);

  @override
  List<Object> get props => [exception]; // مقایسه حالت بر اساس خطا.
}
