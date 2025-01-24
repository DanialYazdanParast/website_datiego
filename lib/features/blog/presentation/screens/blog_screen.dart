import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
            color: const Color(0xFFf8f8f8), // معادل background-color
            borderRadius: BorderRadius.circular(32),

            border: Border.all(
              color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
              width: 1, // معادل border-width
              style: BorderStyle.solid, // معادل border-style
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                'Blog is Empty',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 1000.ms, curve: Curves.easeIn)
            .moveY(begin: 50, end: 0, duration: 800.ms, curve: Curves.easeOut),
      ),
    );
  }
}
