import 'dart:io';

import 'package:dio/dio.dart';

class CustomDio {
  Dio _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  CustomDio.whithAutentication() {
    _dio = Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  _onRequest(RequestOptions options) {
    var token = '';
    options.headers['Auhtorization'] = token;
  }

  _onError(DioError e) {
    print('####### Error Log');
    print(e);
    print('####### Error Log');
  }

  _onResponse(Response e) {
    print('####### Response Log');
    print(e);
    print('####### Response Log');
  }

  BaseOptions _options = BaseOptions(
    baseUrl:
        Platform.isIOS ? 'http://localhost:8888' : 'http://192.168.71.1:8888',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
}
