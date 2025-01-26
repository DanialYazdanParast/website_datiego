import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website_datiego/core/di/service_locator.dart';
import 'package:website_datiego/core/router/go_router.dart';
import 'package:website_datiego/features/home/presentation/screens/home_screen.dart';
import 'package:website_datiego/features/project_detail/presentation/screens/project_detail_screen.dart';
import 'package:website_datiego/features/projects/presentation/screens/projects_screen.dart';
import 'package:website_datiego/features/blog/presentation/screens/blog_screen.dart';
import 'package:website_datiego/features/about_me/presentation/screens/about_me_screen.dart';
import 'package:website_datiego/core/common/root.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ScreenGoRouter.router,
      title: 'Datiego',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
