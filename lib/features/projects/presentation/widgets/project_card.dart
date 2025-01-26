import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:website_datiego/core/router/go_router.dart';
import 'package:website_datiego/core/widgets/image_loding_service.dart';
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
        context.go('${ScreenGoRouter.projects}/$encodedTitle',
            extra: widget.project);
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
                color: const Color(0xFFf8f8f8),
                borderRadius: BorderRadius.circular(32),
                boxShadow: hoveredOnItemCard
                    ? [
                        const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                        ),
                        const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          blurRadius: 16,
                          offset: Offset(0, 4),
                        ),
                        const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          blurRadius: 32,
                          offset: Offset(0, 8),
                        ),
                      ]
                    : [],
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ImageLodingService(
                        imageUrl: widget.project.image!,
                        borderRadius: BorderRadius.circular(15),
                        boxFit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.project.title!,
                    style: const TextStyle(
                      color: Color(0xff212121),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.project.subtitle!,
                    style: const TextStyle(
                      color: Color(0xff6e6e6e),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: widget.project.tag?.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color.fromRGBO(0, 0, 0, 0.1),
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                color: Color(0xff6e6e6e),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList() ??
                        [],
                  ),
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
