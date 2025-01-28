import 'package:flutter/material.dart';
import 'package:website_datiego/core/constants/app_colors.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: LightThemeColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
