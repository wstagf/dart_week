import 'dart:io';

import 'package:dio/dio.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  CustomDio.whithAutentication() {
    _dio = Dio(_options);
  }

  BaseOptions _options = BaseOptions(
    baseUrl:
        Platform.isIOS ? 'http://localhost:8888' : 'http://192.168.71.1:8888',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
}
