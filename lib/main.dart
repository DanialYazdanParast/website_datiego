import 'package:flutter/material.dart';
import 'package:website_datiego/features/home/presentation/screens/home_screen.dart';
import 'package:website_datiego/core/common/root.dart';
import 'package:website_datiego/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print('width: $width');
    print('height: $height');
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
