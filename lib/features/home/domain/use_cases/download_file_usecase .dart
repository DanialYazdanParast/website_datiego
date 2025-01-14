import 'package:website_datiego/features/home/domain/repository/file_downloader_repository.dart';

class DownloadFileUseCase {
  final FileDownloaderRepository repository;

  DownloadFileUseCase(this.repository);

  Future<void> call(String url, String fileName) async {
    await repository.downloadFile(url, fileName);
  }
}
