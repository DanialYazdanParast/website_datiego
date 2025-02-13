import 'package:datiego/features/blog/data/data_source/blog_data_source_remote.dart';
import 'package:datiego/features/blog/data/repository/blog_repository_impl.dart';
import 'package:datiego/features/blog/domain/repository/blog_repository.dart';
import 'package:datiego/features/blog/domain/use_cases/get_blog_usecase.dart';
import 'package:datiego/features/home/domain/use_cases/download_file_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:datiego/core/services/url_launcher_service.dart';
import 'package:datiego/core/constants/app_constants.dart';
import 'package:datiego/features/about_me/data/data_source/skills_data_source.dart';
import 'package:datiego/features/about_me/data/repository/skills_repository_impl.dart';
import 'package:datiego/features/about_me/domain/repository/skills_repository.dart';
import 'package:datiego/features/home/data/repository/file_downloader_repository_impl.dart';
import 'package:datiego/features/home/domain/repository/file_downloader_repository.dart';
import 'package:datiego/features/shared/data/data_source/remote/projects_remote_data_source.dart';
import 'package:datiego/features/shared/data/repository/projects_repository_impl.dart';
import 'package:datiego/features/shared/domain/repository/projects_repository.dart';
import 'package:datiego/features/shared/domain/use_cases/get_projects_usecase.dart';

/// **📌 تنظیمات GetIt برای مدیریت وابستگی‌ها در برنامه**
///
/// این فایل تمام وابستگی‌های مورد نیاز در برنامه را با استفاده از
/// `GetIt` ثبت و مدیریت می‌کند.

/// **📍 نمونه Singleton از `GetIt` برای مدیریت وابستگی‌ها**
final getIt = GetIt.instance;

/// **📦 مقداردهی اولیه و ثبت وابستگی‌ها در `GetIt`**
///
/// این تابع تمام کلاس‌های مورد نیاز برنامه را رجیستر می‌کند تا در سراسر برنامه
/// از طریق `GetIt` قابل دسترسی باشند.
Future<void> init() async {
  /// **🛠️ تنظیم `Dio` برای ارتباط با API**
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: AppConstants.baseUrl)));

  /// **📊 ثبت `ProjectsRemoteDataSource` برای دریافت اطلاعات پروژه‌ها از سرور**
  getIt.registerSingleton<ProjectsRemoteDataSource>(
      ProjectsRemoteDataSourceImpl(getIt.get()));

  /// **🗂️ ثبت `ProjectsRepository` برای مدیریت داده‌های پروژه‌ها**
  getIt.registerSingleton<ProjectsRepository>(
      ProjectsRepositoryImpl(getIt.get()));

  /// **🔍 ثبت `GetProjectsUsecase` برای دریافت پروژه‌ها**
  getIt.registerSingleton<GetProjectsUsecase>(GetProjectsUsecase(getIt.get()));

  /// **📥 ثبت `FileDownloaderRepository` برای دانلود فایل‌ها**
  getIt.registerSingleton<FileDownloaderRepository>(
      FileDownloaderRepositoryImpl());

  /// **⬇️ ثبت `DownloadFileUseCase` برای استفاده از قابلیت دانلود فایل**
  getIt
      .registerSingleton<DownloadFileUseCase>(DownloadFileUseCase(getIt.get()));

  /// **🌐 ثبت `UrlLauncherService` برای باز کردن لینک‌ها در مرورگر**
  getIt.registerSingleton<UrlLauncherService>(UrlLauncherService());

  /// **🛠️ ثبت `SkillsDataSource` برای دریافت مهارت‌ها**
  getIt.registerSingleton<SkillsDataSource>(SkillsDataSourceImpl());

  /// **📚 ثبت `SkillsRepository` برای مدیریت داده‌های مهارت‌ها**
  getIt.registerSingleton<SkillsRepository>(SkillsRepositoryImpl(getIt.get()));

  /// **📝 ثبت `BlogDataSourceRemote` برای دریافت اطلاعات وبلاگ از سرور**
  getIt.registerSingleton<BlogDataSourceRemote>(
      BlogDataSourceRemoteImpl(getIt.get()));

  /// **📖 ثبت `BlogRepository` برای مدیریت داده‌های وبلاگ**
  getIt.registerSingleton<BlogRepository>(BlogRepositoryImpl(getIt.get()));

  /// **🔎 ثبت `GetBlogUsecase` برای دریافت لیست مقالات وبلاگ**
  getIt.registerSingleton<GetBlogUsecase>(GetBlogUsecase(getIt.get()));
}
