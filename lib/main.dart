import 'package:datiego/confing/theme/app_theme.dart';
import 'package:datiego/core/di/service_locator.dart';
import 'package:datiego/core/router/go_router.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// نقطه شروع اجرای برنامه.
///
/// این تابع شامل مراحل اولیه راه‌اندازی برنامه است، مانند مقداردهی اولیه وابستگی‌ها، تنظیم استراتژی URL و اجرای برنامه.
void main() async {
  // مقداردهی اولیه وابستگی‌ها.
  await init();

  // حذف `#` از URL برای بهبود ظاهر و عملکرد در وب.
  setUrlStrategy(PathUrlStrategy());

  // اجرای برنامه.
  runApp(const MyApp());
}

/// کلاس اصلی برنامه.
///
/// این کلاس یک ویجت بدون حالت (StatelessWidget) است که برنامه را با تنظیمات مورد نیاز راه‌اندازی می‌کند.
class MyApp extends StatelessWidget {
  /// سازنده کلاس [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetBlogUsecase getBlogUsecase = getIt.get();
    // getBlogUsecase.call().then((value) {
    //   print(value.toString());
    // }).catchError((e) {
    //   print(e.toString());
    // });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // غیرفعال کردن بنر دیباگ.
      routerConfig:
          ScreenGoRouter.router, // تنظیم مسیردهی با استفاده از `GoRouter`.
      title: 'datiego', // عنوان برنامه.
      theme: MyAppThemeConfig.light().getTheme(), // تم روشن.
      darkTheme: MyAppThemeConfig.dark().getTheme(), // تم تاریک.
      themeMode: ThemeMode.system, // استفاده از حالت تم سیستم.
    );
  }
}
