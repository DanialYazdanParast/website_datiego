import 'package:Datiego/confing/theme/app_theme.dart';
import 'package:Datiego/core/di/service_locator.dart';
import 'package:Datiego/core/router/go_router.dart';
import 'package:Datiego/features/blog/domain/use_cases/get_blog_usecase.dart';
import 'package:flutter/material.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  await init();

  // حذف # از URL
  setUrlStrategy(PathUrlStrategy());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
      debugShowCheckedModeBanner: false,
      routerConfig: ScreenGoRouter.router,
      title: 'Datiego',
      theme: MyAppThemeConfig.light().getTheme(),
      darkTheme: MyAppThemeConfig.dark().getTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
