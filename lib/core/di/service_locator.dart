import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:website_datiego/features/home/data/data_source/remote/projects_remote_data_source.dart';
import 'package:website_datiego/features/home/data/repository/file_downloader_repository_impl.dart';

import 'package:website_datiego/features/home/data/repository/projects_repository_impl.dart';
import 'package:website_datiego/features/home/domain/repository/file_downloader_repository.dart';
import 'package:website_datiego/features/home/domain/repository/projects_repository.dart';
import 'package:website_datiego/features/home/domain/use_cases/download_file_usecase%20.dart';
import 'package:website_datiego/features/home/domain/use_cases/get_projects_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://dan.chbk.app/api/')));

  sl.registerSingleton<ProjectsRemoteDataSource>(
      ProjectsRemoteDataSourceImpl(sl.get()));

  sl.registerSingleton<ProjectsRepository>(ProjectsRepositoryImpl(sl.get()));
  sl.registerSingleton<GetProjectsUsecase>(GetProjectsUsecase(sl.get()));

  sl.registerSingleton<FileDownloaderRepository>(
      FileDownloaderRepositoryImpl());
  sl.registerSingleton<DownloadFileUseCase>(DownloadFileUseCase(sl.get()));
}
