import 'package:dio/dio.dart';
import 'package:Datiego/core/utils/exceptions.dart';

mixin HttpResponseValidat {
  validatResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppException();
    }
  }
}
