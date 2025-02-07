import 'package:Datiego/core/constants/app_constants.dart';
import 'package:Datiego/features/projects/presentation/widgets/project_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Datiego/core/di/service_locator.dart';
import 'package:Datiego/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:Datiego/features/projects/presentation/widgets/build_project_list.dart';
import 'package:Datiego/features/projects/presentation/widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with AutomaticKeepAliveClientMixin {
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
          thumbVisibility: screenWidth >= AppConstants.maxWidthMobile,
          trackVisibility: screenWidth >= AppConstants.maxWidthMobile,
          thickness: 10,
          radius: const Radius.circular(10),
          child: BlocBuilder<ProjectsBloc, ProjectsState>(
            builder: (context, state) {
              if (state is ProjectLoadingState) {
                return buildProjectList(
                  controller: _scrollController,
                  screenWidth: screenWidth,
                  itemCount: 6,
                  itemBuilder: (context, index) => const ProjectCardShimmer(),
                );
              }
              if (state is ProjectSuccesState) {
                return buildProjectList(
                  controller: _scrollController,
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
