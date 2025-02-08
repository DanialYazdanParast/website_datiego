import 'package:Datiego/core/widgets/custom_border.dart';
import 'package:flutter/material.dart';

class BlogContainer extends StatelessWidget {
  final Widget child;

  const BlogContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(32),
        border: customBorder(context),
      ),
      child: child,
    );
  }
}
