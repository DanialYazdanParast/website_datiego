import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.amber,
        width: 100,
        height: 100,
      ).animate().fadeIn(),
    ));
  }
}
