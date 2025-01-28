import 'package:flutter/material.dart';
import 'package:website_datiego/core/constants/app_colors.dart';

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
      style: const TextStyle(
        color: LightThemeColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
