import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  const TextSubtitle({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
