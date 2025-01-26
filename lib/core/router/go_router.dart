import 'package:go_router/go_router.dart';
import 'package:website_datiego/core/common/root.dart';
import 'package:website_datiego/features/about_me/presentation/screens/about_me_screen.dart';
import 'package:website_datiego/features/blog/presentation/screens/blog_screen.dart';
import 'package:website_datiego/features/home/presentation/screens/home_screen.dart';
import 'package:website_datiego/features/project_detail/presentation/screens/project_detail_screen.dart';
import 'package:website_datiego/features/projects/presentation/screens/projects_screen.dart';
import 'package:website_datiego/features/shared/domain/entities/projects_entities.dart';

class ScreenGoRouter {
  static const home = '/';
  static const projects = '/projects';
  static const detail = ':title';
  static const blog = '/blog';
  static const about = '/about';

  static GoRouter router = GoRouter(
    initialLocation: ScreenGoRouter.home, // تنظیم مسیر اولیه به /
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return RootScreen(child: child); // صفحه اصلی شامل BottomNavigation
        },
        routes: [
          GoRoute(
            path: ScreenGoRouter.home, // مسیر اصلی
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomeScreen(),
              );
            },
          ),
          GoRoute(
            path: ScreenGoRouter.projects,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: ProjectsScreen(),
              );
            },
            routes: [
              // زیرمسیر برای ProjectDetailScreen
              GoRoute(
                path: ScreenGoRouter.detail, // استفاده از پارامتر title
                pageBuilder: (context, state) {
                  final project = state.extra
                      as ProjectsEntities?; // دریافت project از extra
                  return NoTransitionPage(
                      child: ProjectDetailScreen(project: project!));
                },
              ),
            ],
          ),
          GoRoute(
            path: ScreenGoRouter.blog,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: BlogScreen(),
              );
            },
          ),
          GoRoute(
            path: ScreenGoRouter.about,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: AboutMeScreen(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
