part of 'home_bloc.dart';

/// کلاس پایه برای رویدادهای مرتبط با `HomeBloc`.
///
/// این کلاس یک کلاس انتزاعی (abstract) است که تمام رویدادهای مرتبط با `HomeBloc` را شامل می‌شود.
/// هر رویداد نماینده یک عمل یا تغییر حالت در بلوک است و از `Equatable` برای مقایسه رویدادها استفاده می‌کند.
abstract class HomeEvent extends Equatable {
  /// سازنده پایه برای کلاس [HomeEvent].
  const HomeEvent();

  @override
  List<Object> get props => [];
}

/// رویداد دریافت پروژه‌ها.
///
/// این رویداد زمانی ارسال می‌شود که نیاز به دریافت لیست پروژه‌ها از منبع داده وجود داشته باشد.
class GetProjectsHomeEvent extends HomeEvent {}

/// رویداد حرکت ماوس بر روی المان‌ها.
///
/// این رویداد زمانی ارسال می‌شود که ماوس بر روی یک المان حرکت کند یا از آن خارج شود.
///
/// ## پارامترها:
/// - [isHovering]: وضعیت هاور (در صورتی که ماوس بر روی المان باشد، مقدار `true` است).
class MouseHoverEvent extends HomeEvent {
  final bool isHovering;

  /// سازنده کلاس [MouseHoverEvent].
  ///
  /// - [isHovering]: وضعیت هاور.
  const MouseHoverEvent(this.isHovering);
}

/// رویداد تنظیم حالت ماوس در منطقه خاصی.
///
/// این رویداد زمانی ارسال می‌شود که ماوس وارد یا خارج از یک منطقه خاص شود.
///
/// ## پارامترها:
/// - [isHovered]: وضعیت هاور (در صورتی که ماوس در منطقه باشد، مقدار `true` است).
class SetMouseRegionEvent extends HomeEvent {
  final bool isHovered;

  /// سازنده کلاس [SetMouseRegionEvent].
  ///
  /// - [isHovered]: وضعیت هاور.
  const SetMouseRegionEvent(this.isHovered);

  @override
  List<Object> get props => [isHovered]; // مقایسه رویداد بر اساس وضعیت هاور.
}

/// رویداد تنظیم حالت هاور بر روی کارت آیتم.
///
/// این رویداد زمانی ارسال می‌شود که ماوس بر روی یک کارت آیتم حرکت کند یا از آن خارج شود.
///
/// ## پارامترها:
/// - [isHovered]: وضعیت هاور (در صورتی که ماوس بر روی کارت باشد، مقدار `true` است).
class SetHoveredOnItemCardEvent extends HomeEvent {
  final bool isHovered;

  /// سازنده کلاس [SetHoveredOnItemCardEvent].
  ///
  /// - [isHovered]: وضعیت هاور.
  const SetHoveredOnItemCardEvent(this.isHovered);

  @override
  List<Object> get props => [isHovered]; // مقایسه رویداد بر اساس وضعیت هاور.
}

/// رویداد دانلود فایل.
///
/// این رویداد زمانی ارسال می‌شود که کاربر درخواست دانلود یک فایل (مانند رزومه) داشته باشد.
///
/// ## پارامترها:
/// - [url]: آدرس URL فایل برای دانلود.
/// - [fileName]: نام فایل برای ذخیره.
class DownloadFileEvent extends HomeEvent {
  final String url;
  final String fileName;

  /// سازنده کلاس [DownloadFileEvent].
  ///
  /// - [url]: آدرس URL فایل برای دانلود.
  /// - [fileName]: نام فایل برای ذخیره.
  const DownloadFileEvent({required this.url, required this.fileName});

  @override
  List<Object> get props =>
      [url, fileName]; // مقایسه رویداد بر اساس URL و نام فایل.
}
