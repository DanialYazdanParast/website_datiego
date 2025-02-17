import 'package:datiego/core/widgets/custom_scrollbar.dart';
import 'package:datiego/features/projects/presentation/widgets/project_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:datiego/core/di/service_locator.dart';
import 'package:datiego/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:datiego/features/projects/presentation/widgets/build_project_list.dart';
import 'package:datiego/features/projects/presentation/widgets/project_card.dart';

/// صفحه پروژه‌ها.
///
/// این کلاس یک صفحه فلاتر است که لیست پروژه‌ها را نمایش می‌دهد.
/// از BLoC برای مدیریت حالت‌ها و داده‌ها استفاده می‌کند و شامل حالت‌های بارگذاری، موفقیت و خطا است.
class ProjectsScreen extends StatefulWidget {
  /// سازنده کلاس [ProjectsScreen].
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  /// کنترل‌کننده اسکرول برای مدیریت حرکت در صفحه.
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    /// آزادسازی منابع مرتبط با کنترل‌کننده اسکرول.
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// دریافت عرض صفحه برای تنظیمات واکنش‌گرا.
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => ProjectsBloc(getIt.get())
          ..add(GetProjectsEvent()), // ایجاد و مقداردهی اولیه BLoC.
        child: CustomScrollbar(
          controller: _scrollController,
          child: BlocBuilder<ProjectsBloc, ProjectsState>(
            builder: (context, state) {
              if (state is ProjectLoadingState) {
                /// حالت بارگذاری: نمایش لیستی از کارت‌های شیمیر (Shimmer).
                return buildProjectList(
                  controller: _scrollController,
                  screenWidth: screenWidth,
                  itemCount: 6, // تعداد کارت‌های شیمیر.
                  context: context,
                  itemBuilder: (context, index) => const ProjectCardShimmer(),
                );
              }
              if (state is ProjectSuccesState) {
                /// حالت موفقیت: نمایش لیست پروژه‌ها.
                return buildProjectList(
                  controller: _scrollController,
                  screenWidth: screenWidth,
                  itemCount: state.projects.length, // تعداد پروژه‌ها.
                  context: context,
                  itemBuilder: (context, index) => ProjectCard(
                    index: index,
                    project: state.projects[index], // داده‌های هر پروژه.
                  ),
                );
              } else if (state is ProjectErrorState) {
                /// حالت خطا: نمایش پیام خطا.
                return const Center(
                  child: Text('An error occurred or no data available.'),
                );
              } else {
                /// مدیریت حالت‌های ناشناخته.
                throw Exception('Error state not handled');
              }
            },
          ),
        ),
      ),
    );
  }
}
