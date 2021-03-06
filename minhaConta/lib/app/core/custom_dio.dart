import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../repositories/usuario_repository.dart';

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

  _onRequest(RequestOptions options) async {
    var token = await UsuarioRepository().getToken();
    options.headers['Authorization'] = token;
  }

  _onError(DioError e) {
    print('####### Error Log');
    print(e);
    print('####### Error Log');
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      UsuarioRepository().logout();
      Get.offAllNamed('/');
    }
  }

  _onResponse(Response e) {
    print('####### Response Log');
    print(e);
    print('####### Response Log');
  }

  BaseOptions _options = BaseOptions(
    baseUrl: Platform.isIOS ? 'http://localhost' : 'http://192.168.1.8',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
}
