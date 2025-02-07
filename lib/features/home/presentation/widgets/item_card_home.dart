import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Datiego/core/router/go_router.dart';
import 'package:Datiego/core/widgets/image_loding_service.dart';
import 'package:Datiego/features/home/presentation/bloc/home_bloc.dart';
import 'package:Datiego/features/shared/domain/entities/projects_entities.dart';

class ItemCardHome extends StatelessWidget {
  const ItemCardHome({
    super.key,
    required this.width,
    required this.height,
    required this.alignmentx,
    required this.alignmenty,
    required this.angle,
    required this.project,
  });

  final double width;
  final double height;
  final double alignmentx;
  final double alignmenty;
  final double angle;

  final ProjectsEntities project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final encodedTitle = Uri.encodeComponent(project.title!);

        context.go(
          '${ScreenGoRouter.projects}/$encodedTitle',
          extra: project,
        );
      },
      child: Align(
        alignment: Alignment(alignmentx, alignmenty),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => context
              .read<HomeBloc>()
              .add(const SetHoveredOnItemCardEvent(true)),
          onExit: (_) => context
              .read<HomeBloc>()
              .add(const SetHoveredOnItemCardEvent(false)),
          child: Transform.rotate(
            angle: angle,
            child: SizedBox(
              height: 170,
              width: 220,
              child: ImageLodingService(
                imageUrl: project.image!,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ).animate().fadeIn().scale(),
    );
  }
}
