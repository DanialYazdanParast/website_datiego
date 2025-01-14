abstract class FileDownloaderRepository {
  Future<void> downloadFile(String url, String fileName);
}
