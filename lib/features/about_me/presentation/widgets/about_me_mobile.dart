import 'package:datiego/features/about_me/presentation/widgets/profile_details_widget.dart';
import 'package:datiego/features/about_me/presentation/widgets/profile_intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({
    super.key,
    required this.scrollController,
    required this.width,
  });

  final ScrollController scrollController;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: false,
      trackVisibility: false,
      thickness: 10,
      radius: const Radius.circular(10),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 120,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 24,
                ),
                child: ProfileIntroWidget(),
              ),
              ProfileDetailsWidget(),
            ],
          )
              .animate()
              .slideY(
                  begin: 0.2, // Start slightly below
                  end: 0, // End at its normal position
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut)
              .fadeIn(),
        ),
      ),
    );
  }
}
