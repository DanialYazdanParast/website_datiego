import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Datiego/core/router/go_router.dart';
import 'package:Datiego/core/widgets/custom_border.dart';
import 'package:Datiego/core/widgets/custom_box_shadow.dart';
import 'package:Datiego/core/widgets/image_loding_service.dart';
import 'package:Datiego/core/widgets/tag_project.dart';
import 'package:Datiego/core/widgets/text_subtitle.dart';
import 'package:Datiego/core/widgets/text_title.dart';

import 'package:Datiego/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:Datiego/features/shared/domain/entities/projects_entities.dart';

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
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: hoveredOnItemCard ? customBoxShadow : [],
                  border: customBorder(context),
                ),
                child: Column(
                  // mainAxisSize:
                  //     MainAxisSize.max, // محتوای کارت بر اساس نیاز رشد می‌کند
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: SizedBox(
                        width: double.infinity,
                        child: ImageLodingService(
                          imageUrl: widget.project.image!,
                          borderRadius: BorderRadius.circular(8),
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
        // .animate()
        // .slideY(
        //     begin: 0.2, // Start slightly below
        //     end: 0, // End at its normal position
        //     duration: const Duration(milliseconds: 500),
        //     curve: Curves.easeOut)
        // .fadeIn(),
        );
  }

  @override
  bool get wantKeepAlive => true;
}
