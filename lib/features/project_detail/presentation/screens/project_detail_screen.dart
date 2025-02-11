import 'package:datiego/core/constants/app_colors.dart';
import 'package:datiego/core/services/url_launcher_service.dart';
import 'package:datiego/core/utils/responsive.dart';
import 'package:datiego/core/widgets/custom_button.dart';
import 'package:datiego/core/widgets/description_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:datiego/core/widgets/custom_close_button.dart';
import 'package:datiego/core/widgets/image_detail.dart';
import 'package:datiego/core/widgets/tag_project.dart';

import 'package:datiego/core/widgets/text_title.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

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
    final urlLauncher = GetIt.instance<UrlLauncherService>();
    return Scaffold(
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: Responsive.isDesktop(context),
        trackVisibility: Responsive.isDesktop(context),
        thickness: 10,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: TweenAnimationBuilder<EdgeInsets>(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween<EdgeInsets>(
                      end: EdgeInsets.only(
                        top: 100,
                        left: horizontalPadding,
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
                            ImageDetail(imageUrl: widget.project.image!),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextTitle(title: widget.project.title!),
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: CustomButton(
                                    onTap: () async {
                                      if (widget.project.gitHubLink != null) {
                                        await urlLauncher.openUrl(
                                            widget.project.gitHubLink!);
                                      }
                                    },
                                    color: AppColors.lightBlue,
                                    icon: FontAwesomeIcons.github,
                                    text: "View on GitHub",
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(height: 16),
                            // TextSubtitle(subtitle: widget.project.subtitle!),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TagProject(tag: widget.project.tag!),
                            ),
                            const SizedBox(height: 24),
                            DescriptionWidget(
                                description: widget.project.description!),
                          ],
                        )
                            .animate()
                            .slideY(begin: 0.2, end: 0, curve: Curves.easeOut)
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
