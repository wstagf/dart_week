import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

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

  Dio get instance => _dio;

  _onRequest(RequestOptions options) {
    var token = '';
    options.headers['Auhtorization'] = token;
  }

  _onError(DioError e) {
    print('####### Error Log');
    print(e);
    print('####### Error Log');
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      // TODO: Fazer o logout do usuario
      Get.offAllNamed('/');
    }
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
