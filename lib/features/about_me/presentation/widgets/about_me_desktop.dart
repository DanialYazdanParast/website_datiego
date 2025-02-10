import 'package:datiego/features/about_me/presentation/widgets/profile_details_widget.dart';
import 'package:datiego/features/about_me/presentation/widgets/profile_intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutMeDesktop extends StatelessWidget {
  const AboutMeDesktop({
    super.key,
    required this.scrollController,
    required this.width,
  });

  final ScrollController scrollController;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // بخش ثابت سمت چپ
        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 120, left: width * 0.1),
            child: const ProfileIntroWidget()
                .animate()
                .slideY(
                    begin: 0.2, // Start slightly below
                    end: 0, // End at its normal position
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut)
                .fadeIn(),
          ),
        ),

        // بخش اسکرول‌پذیر سمت راست
        const SizedBox(
          width: 24,
        ),

        Expanded(
          flex: 9,
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 10,
            radius: const Radius.circular(10),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.1, top: 30, bottom: 120),
                    child: const ProfileDetailsWidget()
                        .animate()
                        .slideY(
                            begin: 0.2, // Start slightly below
                            end: 0, // End at its normal position
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeOut)
                        .fadeIn(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
