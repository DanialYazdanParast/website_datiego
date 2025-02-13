import 'package:dio/dio.dart';

/// رابط (Interface) برای منبع داده‌های دوردست پروژه‌ها.
///
/// این کلاس یک رابط انتزاعی است که عملیات مربوط به دریافت اطلاعات پروژه‌ها را تعریف می‌کند.
abstract class ProjectsRemoteDataSource {
  /// دریافت لیست پروژه‌ها از منبع دوردست.
  ///
  /// ## بازگشت:
  /// داده‌های دریافتی از سرور به صورت `Future<dynamic>`.
  Future<dynamic> getProjects();
}

/// پیاده‌سازی رابط `ProjectsRemoteDataSource` برای دریافت اطلاعات پروژه‌ها.
///
/// این کلاس از کتابخانه `Dio` برای ارسال درخواست‌های HTTP و دریافت داده‌ها استفاده می‌کند.
class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  /// نمونه‌ای از کلاس `Dio` برای مدیریت درخواست‌های HTTP.
  final Dio _dio;

  /// سازنده کلاس [ProjectsRemoteDataSourceImpl].
  ///
  /// - [_dio]: نمونه‌ای از کلاس `Dio` برای ارسال درخواست‌ها.
  const ProjectsRemoteDataSourceImpl(this._dio);

  @override
  Future<dynamic> getProjects() async {
    // ارسال درخواست GET برای دریافت لیست پروژه‌ها.
    var response = await _dio.get(
      'collections/projects/records', // آدرس API.
      queryParameters: {
        'expand': 'tag', // گسترش تگ‌ها برای دریافت اطلاعات بیشتر.
      },
    );
    return response; // بازگرداندن داده‌های دریافتی از سرور.
  }
}
