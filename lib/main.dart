import 'package:flutter/material.dart';

import 'package:website_datiego/core/di/service_locator.dart';
import 'package:website_datiego/core/router/go_router.dart';

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
