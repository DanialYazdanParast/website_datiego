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

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: AppConstants.baseUrl)));
  getIt.registerSingleton<ProjectsRemoteDataSource>(
      ProjectsRemoteDataSourceImpl(getIt.get()));
  getIt.registerSingleton<ProjectsRepository>(
      ProjectsRepositoryImpl(getIt.get()));
  getIt.registerSingleton<GetProjectsUsecase>(GetProjectsUsecase(getIt.get()));
  getIt.registerSingleton<FileDownloaderRepository>(
      FileDownloaderRepositoryImpl());
  getIt
      .registerSingleton<DownloadFileUseCase>(DownloadFileUseCase(getIt.get()));
  getIt.registerSingleton<UrlLauncherService>(UrlLauncherService());
  getIt.registerSingleton<SkillsDataSource>(SkillsDataSourceImpl());
  getIt.registerSingleton<SkillsRepository>(SkillsRepositoryImpl(getIt.get()));
  getIt.registerSingleton<BlogDataSourceRemote>(
      BlogDataSourceRemoteImpl(getIt.get()));
  getIt.registerSingleton<BlogRepository>(BlogRepositoryImpl(getIt.get()));
  getIt.registerSingleton<GetBlogUsecase>(GetBlogUsecase(getIt.get()));
}
