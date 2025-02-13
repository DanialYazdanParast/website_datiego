import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:datiego/core/router/go_router.dart';
import 'package:datiego/core/widgets/custom_border.dart';
import 'package:datiego/core/widgets/custom_box_shadow.dart';
import 'package:datiego/core/widgets/image_loding_service.dart';
import 'package:datiego/core/widgets/tag_project.dart';
import 'package:datiego/core/widgets/text_subtitle.dart';
import 'package:datiego/core/widgets/text_title.dart';
import 'package:datiego/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';

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

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
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
          cursor: SystemMouseCursors.click,
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
        ));
  }
}
