import 'package:flutter/material.dart';
import 'package:website_datiego/core/constants/app_colors.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';

class TagProject extends StatelessWidget {
  const TagProject({
    super.key,
    required this.tag,
  });

  final List<String> tag;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: tag.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                  color: LightThemeColors.onsecondaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: customBorder),
              child: Text(
                tag,
                style: const TextStyle(
                  color: LightThemeColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList() ??
          [],
    );
  }
}
