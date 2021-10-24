import 'package:auresgate/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/connect.dart';

class ApiBase extends GetConnect {
  late Dio client;

  ApiBase(String path, {bool useLogger = true}) {
    var url = ApiConstants.BASE_URL + path;
    var opts = BaseOptions(
      baseUrl: url,
      connectTimeout: 15000,
      contentType: "application/json",
    );

    client = Dio(opts);
  }
}
