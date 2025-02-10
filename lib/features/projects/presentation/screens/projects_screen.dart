import 'package:datiego/core/utils/responsive.dart';
import 'package:datiego/features/projects/presentation/widgets/project_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:datiego/core/di/service_locator.dart';
import 'package:datiego/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:datiego/features/projects/presentation/widgets/build_project_list.dart';
import 'package:datiego/features/projects/presentation/widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => ProjectsBloc(getIt.get())..add(GetProjectsEvent()),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: Responsive.isDesktop(context),
          trackVisibility: Responsive.isDesktop(context),
          thickness: 10,
          radius: const Radius.circular(10),
          child: BlocBuilder<ProjectsBloc, ProjectsState>(
            builder: (context, state) {
              if (state is ProjectLoadingState) {
                return buildProjectList(
                  controller: _scrollController,
                  screenWidth: screenWidth,
                  itemCount: 6,
                  context: context,
                  itemBuilder: (context, index) => const ProjectCardShimmer(),
                );
              }
              if (state is ProjectSuccesState) {
                return buildProjectList(
                  controller: _scrollController,
                  screenWidth: screenWidth,
                  itemCount: state.projects.length,
                  context: context,
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
