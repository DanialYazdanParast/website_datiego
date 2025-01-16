import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:website_datiego/core/di/service_locator.dart';
import 'package:website_datiego/core/widgets/image_loding_service.dart';
import 'package:website_datiego/features/home/presentation/screens/home_screen.dart';
import 'package:website_datiego/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:website_datiego/features/projects/presentation/widgets/build_project_list.dart';
import 'package:website_datiego/features/projects/presentation/widgets/project_card.dart';
import 'package:website_datiego/features/projects/presentation/widgets/project_card_shimmer.dart';
import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ProjectsBloc(sl.get())..add(GetProjectsEvent()),
        // مقدار اولیه برای hoverState
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 10,
          radius: const Radius.circular(10),
          child: BlocBuilder<ProjectsBloc, ProjectsState>(
            builder: (context, state) {
              if (state is ProjectLoadingState) {
                return buildProjectList(
                  controller: scrollController,
                  screenWidth: screenWidth,
                  itemCount: 6,
                  itemBuilder: (context, index) => ProjectCardShimmer(),
                );
              }
              if (state is ProjectSuccesState) {
                return buildProjectList(
                  controller: scrollController,
                  screenWidth: screenWidth,
                  itemCount: state.projects.length,
                  itemBuilder: (context, index) => ProjectCard(
                    index: index,
                    project: state.projects[index],
                  ),
                );
              } else if (state is ProjectErrorState) {
                return const Center(
                  child: Text('An error occurred or no data available.'),
                );
              } else {
                throw Exception('Error state not handled');
              }
            },
          ),
        ),
      ),
    );
  }
}
