import 'package:flutter/material.dart';

class TextTitelAbout extends StatelessWidget {
  final String text;
  const TextTitelAbout({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
