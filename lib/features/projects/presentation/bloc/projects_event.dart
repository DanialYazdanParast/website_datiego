part of 'projects_bloc.dart';

/// کلاس پایه برای رویدادهای مرتبط با `ProjectsBloc`.
///
/// این کلاس یک کلاس انتزاعی (abstract) است که تمام رویدادهای مرتبط با `ProjectsBloc` را شامل می‌شود.
/// هر رویداد نماینده یک عمل یا تغییر حالت در بلوک است و از `Equatable` برای مقایسه رویدادها استفاده می‌کند.
abstract class ProjectsEvent extends Equatable {
  /// سازنده پایه برای کلاس [ProjectsEvent].
  const ProjectsEvent();

  @override
  List<Object> get props => [];
}

/// رویداد دریافت پروژه‌ها.
///
/// این رویداد زمانی ارسال می‌شود که نیاز به دریافت لیست پروژه‌ها از منبع داده وجود داشته باشد.
class GetProjectsEvent extends ProjectsEvent {}

/// رویداد تنظیم حالت هاور بر روی یک آیتم پروژه.
///
/// این رویداد زمانی ارسال می‌شود که ماوس بر روی یک آیتم پروژه حرکت کند یا از آن خارج شود.
///
/// ## پارامترها:
/// - [index]: شاخص (Index) آیتم پروژه در لیست.
/// - [isHovered]: وضعیت هاور (در صورتی که ماوس بر روی آیتم باشد، مقدار `true` است).
class HoverItemEvent extends ProjectsEvent {
  final int index;
  final bool isHovered;

  /// سازنده کلاس [HoverItemEvent].
  ///
  /// - [index]: شاخص آیتم پروژه در لیست.
  /// - [isHovered]: وضعیت هاور.
  const HoverItemEvent(this.index, this.isHovered);

  @override
  List<Object> get props =>
      [index, isHovered]; // مقایسه رویداد بر اساس شاخص و وضعیت هاور.
}
