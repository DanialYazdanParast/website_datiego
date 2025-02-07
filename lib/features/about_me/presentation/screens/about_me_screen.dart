import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:Datiego/core/constants/app_constants.dart';
import 'package:Datiego/features/about_me/presentation/widgets/profile_details_widget.dart';
import 'package:Datiego/features/about_me/presentation/widgets/profile_intro_widget.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= AppConstants.maxWidthmobile) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // بخش ثابت سمت چپ
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 30, bottom: 120, left: constraints.maxWidth * 0.1),
                  child: ProfileIntroWidget(screenheight: constraints.maxHeight)
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
                              right: constraints.maxWidth * 0.1,
                              top: 30,
                              bottom: 120),
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
        } else {
          return Scrollbar(
            controller: scrollController,
            thumbVisibility: false,
            trackVisibility: false,
            thickness: 10,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 120,
                  left: constraints.maxWidth * 0.05,
                  right: constraints.maxWidth * 0.05,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 24,
                      ),
                      child: ProfileIntroWidget(
                          screenheight: constraints.maxHeight),
                    ),
                    const ProfileDetailsWidget(),
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
      }),
    );
  }
}
