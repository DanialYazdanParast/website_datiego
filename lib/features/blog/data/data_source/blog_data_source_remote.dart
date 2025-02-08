import 'package:dio/dio.dart';

abstract class BlogDataSourceRemote {
  Future<dynamic> getBlogs();
}

class BlogDataSourceRemoteImpl implements BlogDataSourceRemote {
  final Dio _dio;
  const BlogDataSourceRemoteImpl(this._dio);
  @override
  Future<dynamic> getBlogs() async {
    var response = await _dio.get('collections/blog/records');
    return response;
  }
}
