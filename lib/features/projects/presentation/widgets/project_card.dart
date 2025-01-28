import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:website_datiego/core/constants/app_colors.dart';
import 'package:website_datiego/core/router/go_router.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';
import 'package:website_datiego/core/widgets/custom_box_shadow.dart';
import 'package:website_datiego/core/widgets/image_loding_service.dart';
import 'package:website_datiego/core/widgets/tag_project.dart';
import 'package:website_datiego/core/widgets/text_subtitle.dart';
import 'package:website_datiego/core/widgets/text_title.dart';

import 'package:website_datiego/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';

class ProjectCard extends StatefulWidget {
  final int index;
  final ProjectsEntities project;

  const ProjectCard({
    super.key,
    required this.index,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final hoveredOnItemCard = context.select<ProjectsBloc, bool>((bloc) {
      final state = bloc.state;
      if (state is ProjectSuccesState) {
        return state.hoveredItems[widget.index] ?? false;
      }
      return false;
    });

    return GestureDetector(
      onTap: () {
        final encodedTitle = Uri.encodeComponent(widget.project.title!);
        context.go(
          '${ScreenGoRouter.projects}/$encodedTitle',
          extra: widget.project,
        );
      },
      child: MouseRegion(
        onEnter: (_) => context
            .read<ProjectsBloc>()
            .add(HoverItemEvent(widget.index, true)),
        onExit: (_) => context
            .read<ProjectsBloc>()
            .add(HoverItemEvent(widget.index, false)),
        child: Transform.rotate(
            angle: hoveredOnItemCard ? -0.02 : 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: LightThemeColors.secondaryColor,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: hoveredOnItemCard ? customBoxShadow : [],
                  border: customBorder),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ImageLodingService(
                        imageUrl: widget.project.image!,
                        borderRadius: BorderRadius.circular(15),
                        //      boxFit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextTitle(title: widget.project.title!),
                  const SizedBox(height: 16),
                  TextSubtitle(subtitle: widget.project.subtitle!),
                  const SizedBox(height: 16),
                  TagProject(tag: widget.project.tag!),
                ],
              ),
            )),
      )
          .animate()
          .slideY(
              begin: 0.2, // Start slightly below
              end: 0, // End at its normal position
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut)
          .fadeIn(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
