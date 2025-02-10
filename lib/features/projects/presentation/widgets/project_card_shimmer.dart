import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:datiego/core/widgets/custom_border.dart';

class ProjectCardShimmer extends StatelessWidget {
  const ProjectCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(32),
          border: customBorder(context)),
      child: Shimmer.fromColors(
        baseColor: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
        highlightColor: isDarkMode ? Colors.grey[500]! : Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black54 : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 150,
              height: 24,
              color: isDarkMode ? Colors.black54 : Colors.white,
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 16,
              color: isDarkMode ? Colors.black54 : Colors.white,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List.generate(3, (index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.black54 : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 80,
                  height: 30,
                );
              }),
            ),
          ],
        ),
      ),
    )
        .animate()
        .slideY(
            begin: 0.2, // Start slightly below
            end: 0, // End at its normal position
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut)
        .fadeIn();
  }
}
