import 'package:Datiego/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:Datiego/features/project_detail/presentation/widgets/custom_close_button.dart';
import 'package:Datiego/features/project_detail/presentation/widgets/image_project.dart';
import 'package:Datiego/core/widgets/tag_project.dart';
import 'package:Datiego/core/widgets/text_subtitle.dart';
import 'package:Datiego/core/widgets/text_title.dart';
import 'package:Datiego/features/shared/domain/entities/projects_entities.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({
    super.key,
    required this.project,
  });
  final ProjectsEntities project;
  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  double horizontalPadding = 20.0;
  final ScrollController scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updatePadding();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _updatePadding() {
    final screenWidth = MediaQuery.of(context).size.width;
    setState(() {
      horizontalPadding = screenWidth > 1200 ? screenWidth * 0.18 : 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: screenWidth >= AppConstants.maxWidthMobile,
        trackVisibility: screenWidth >= AppConstants.maxWidthMobile,
        thickness: 10,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: TweenAnimationBuilder<EdgeInsets>(
                    // Use TweenAnimationBuilder
                    duration: const Duration(
                        milliseconds: 500), // Adjust duration as needed
                    tween: Tween<EdgeInsets>(
                      end: EdgeInsets.only(
                        top: 100,
                        left: horizontalPadding, // End padding
                        right: horizontalPadding,
                        bottom: 120,
                      ),
                    ),
                    builder: (context, padding, child) {
                      return Padding(
                        padding: padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageProject(
                                screenHeight: screenHeight,
                                imageUrl: widget.project.image!),
                            const SizedBox(height: 16),
                            TextTitle(title: widget.project.title!),
                            const SizedBox(height: 16),
                            TextSubtitle(subtitle: widget.project.subtitle!),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TagProject(tag: widget.project.tag!),
                            ),
                            const SizedBox(height: 24),
                            Html(
                              data: widget.project.description!,
                            ),
                            const SizedBox(height: 100),
                          ],
                        )
                            .animate()
                            .slideY(
                                begin: 0.2, // Start slightly below
                                end: 0, // End at its normal position
                                //   duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOut)
                            .fadeIn(),
                      );
                    },
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 20,
              child: CustomCloseButton(),
            ),
          ],
        ),
      ),
    );
  }
}
