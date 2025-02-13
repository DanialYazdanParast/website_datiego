import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog_detail/presentation/screens/blog_detail_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:datiego/core/common/root.dart';
import 'package:datiego/features/about_me/presentation/screens/about_me_screen.dart';
import 'package:datiego/features/blog/presentation/screens/blog_screen.dart';
import 'package:datiego/features/home/presentation/screens/home_screen.dart';
import 'package:datiego/features/project_detail/presentation/screens/project_detail_screen.dart';
import 'package:datiego/features/projects/presentation/screens/projects_screen.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';

/// **📌 ScreenGoRouter - مدیریت مسیرهای ناوبری در برنامه**
///
/// این کلاس تمامی مسیرهای برنامه را مدیریت می‌کند و از `GoRouter` برای ناوبری بین صفحات استفاده می‌کند.

/// **🔗 کلاس مدیریت مسیرها در برنامه**
class ScreenGoRouter {
  /// **🏠 مسیر صفحه اصلی**
  static const home = '/';

  /// **📂 مسیر صفحه پروژه‌ها**
  static const projects = '/projects';

  /// **📑 مسیر جزئیات پروژه (با عنوان پروژه به عنوان پارامتر)**
  static const detailProjects = ':title';

  /// **📝 مسیر صفحه وبلاگ**
  static const blog = '/blog';

  /// **ℹ️ مسیر صفحه درباره من**
  static const about = '/about';

  /// **📖 مسیر جزئیات وبلاگ (با عنوان مقاله به عنوان پارامتر)**
  static const detailBlog = ':title';

  /// **🚀 تعریف `GoRouter` برای مدیریت مسیرهای برنامه**
  static GoRouter router = GoRouter(
    initialLocation: ScreenGoRouter.home, // مسیر پیش‌فرض: صفحه اصلی
    routes: [
      /// **🛠️ `ShellRoute` - صفحه پایه‌ای با `BottomNavigation`**
      ShellRoute(
        builder: (context, state, child) {
          return RootScreen(
              child: child); // `RootScreen` شامل `BottomNavigation`
        },
        routes: [
          /// **🏠 مسیر صفحه اصلی**
          GoRoute(
            path: ScreenGoRouter.home,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomeScreen(),
              );
            },
          ),

          /// **📂 مسیر صفحه پروژه‌ها**
          GoRoute(
            path: ScreenGoRouter.projects,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: ProjectsScreen(),
              );
            },
            routes: [
              /// **📑 مسیر جزئیات پروژه**
              GoRoute(
                path: ScreenGoRouter.detailProjects,
                pageBuilder: (context, state) {
                  final project = state.extra
                      as ProjectsEntities?; // دریافت داده `project` از `extra`
                  return NoTransitionPage(
                      child: ProjectDetailScreen(project: project!));
                },
              ),
            ],
          ),

          /// **📝 مسیر صفحه وبلاگ**
          GoRoute(
            path: ScreenGoRouter.blog,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: BlogScreen(),
              );
            },
            routes: [
              /// **📖 مسیر جزئیات مقاله در وبلاگ**
              GoRoute(
                path: ScreenGoRouter.detailBlog,
                pageBuilder: (context, state) {
                  final blog = state.extra as BlogEntities?;
                  return NoTransitionPage(child: BlogDetailScreen(blog: blog!));
                },
              ),
            ],
          ),

          /// **ℹ️ مسیر صفحه درباره من**
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
