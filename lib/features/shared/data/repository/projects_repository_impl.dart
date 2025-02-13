import 'package:datiego/core/utils/response_validator.dart';
import 'package:datiego/features/shared/data/data_source/remote/projects_remote_data_source.dart';
import 'package:datiego/features/shared/data/models/projects_models.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:datiego/features/shared/domain/repository/projects_repository.dart';

/// پیاده‌سازی مخزن پروژه‌ها.
///
/// این کلاس یک پیاده‌سازی ملموس از رابط `ProjectsRepository` است که عملیات دریافت لیست پروژه‌ها را مدیریت می‌کند.
/// این کلاس از منبع داده‌های دوردست (`ProjectsRemoteDataSource`) برای دریافت داده‌ها استفاده می‌کند و پاسخ‌ها را اعتبارسنجی می‌کند.
class ProjectsRepositoryImpl extends ProjectsRepository
    with HttpResponseValidat {
  /// منبع داده‌های دوردست برای دریافت اطلاعات پروژه‌ها.
  final ProjectsRemoteDataSource remoteDataSource;

  /// سازنده کلاس [ProjectsRepositoryImpl].
  ///
  /// - [remoteDataSource]: نمونه‌ای از منبع داده‌های دوردست برای دریافت پروژه‌ها.
  ProjectsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProjectsEntities>> getProjects() async {
    // دریافت پاسخ از منبع داده‌های دوردست.
    var response = await remoteDataSource.getProjects();

    // اعتبارسنجی پاسخ دریافتی.
    validatResponse(response);

    // تبدیل داده‌های JSON به لیستی از شیءهای `ProjectsModels`.
    return response.data['items']
        .map<ProjectsModels>(
            (jsonObject) => ProjectsModels.fromJson(jsonObject))
        .toList();
  }
}
