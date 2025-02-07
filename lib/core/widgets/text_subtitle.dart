import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  const TextSubtitle({
    super.key,
    required this.subtitle,
    this.maxLines = 1,
  });

  final String subtitle;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.titleMedium,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
