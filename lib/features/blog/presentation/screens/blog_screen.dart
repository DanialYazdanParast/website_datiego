import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .secondary, // معادل background-color
            borderRadius: BorderRadius.circular(32),

            border: customBorder(context),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                'Blog is Empty',
                style: Theme.of(context).textTheme.titleLarge,
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
