import 'package:flutter/material.dart';
import 'package:website_datiego/core/constants/app_colors.dart';

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
      style: const TextStyle(
        color: LightThemeColors.textSecondary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
