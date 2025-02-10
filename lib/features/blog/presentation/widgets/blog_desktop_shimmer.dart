import 'package:datiego/features/blog/presentation/widgets/blog_button.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

class BlogDesktopShimmer extends StatelessWidget {
  const BlogDesktopShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return AspectRatio(
        aspectRatio: 2,
        child: BlogContainer(
          child: Shimmer.fromColors(
            baseColor: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            highlightColor: isDarkMode ? Colors.grey[500]! : Colors.grey[100]!,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.black54 : Colors.white,
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(32)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 24,
                                color:
                                    isDarkMode ? Colors.black54 : Colors.white,
                              ),
                              const SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                height: 16,
                                color:
                                    isDarkMode ? Colors.black54 : Colors.white,
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 350,
                                height: 16,
                                color:
                                    isDarkMode ? Colors.black54 : Colors.white,
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 200,
                                height: 16,
                                color:
                                    isDarkMode ? Colors.black54 : Colors.white,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: BlogButton(
                            color: isDarkMode ? Colors.black54 : Colors.white,
                            text: "Read More",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
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
            .fadeIn());
  }
}
