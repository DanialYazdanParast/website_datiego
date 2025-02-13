import 'package:dio/dio.dart';

/// منبع داده‌های وبلاگ از سرور (خارج از اپلیکیشن)
/// اینترفیس `BlogDataSourceRemote` برای دریافت اطلاعات وبلاگ‌ها از سرور تعریف شده است.
abstract class BlogDataSourceRemote {
  /// متدی که اطلاعات وبلاگ‌ها را از سرور می‌گیرد.
  Future<dynamic> getBlogs();
}

/// پیاده‌سازی منبع داده‌های وبلاگ از سرور با استفاده از `Dio`
/// این کلاس مسئول ارتباط با API وبلاگ‌ها است.
class BlogDataSourceRemoteImpl implements BlogDataSourceRemote {
  final Dio _dio;

  /// سازنده که شیء `Dio` را برای ارتباط با سرور می‌گیرد.
  const BlogDataSourceRemoteImpl(this._dio);

  /// پیاده‌سازی متد `getBlogs` که اطلاعات وبلاگ‌ها را از API می‌گیرد.
  /// این متد درخواست GET به آدرس مشخص‌شده در API ارسال می‌کند.
  @override
  Future<dynamic> getBlogs() async {
    // ارسال درخواست GET برای دریافت داده‌ها از مسیر `collections/blog/records`
    var response = await _dio.get('collections/blog/records');

    // بازگشت پاسخ دریافتی از سرور
    return response;
  }
}
