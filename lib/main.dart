import 'package:flutter/material.dart';
import 'package:website_datiego/core/di/service_locator.dart';
import 'package:website_datiego/features/home/domain/repository/projects_repository.dart';
import 'package:website_datiego/features/home/presentation/screens/home_screen.dart';
import 'package:website_datiego/core/common/root.dart';
import 'package:website_datiego/test.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectsRepository projectsRepository = sl.get();
    projectsRepository.getProjects().then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Datiego',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RootScreen());
  }
}
