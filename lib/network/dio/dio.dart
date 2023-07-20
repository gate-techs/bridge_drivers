import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:kishk_driver/network/urls/apis.dart';

import '../dio_inter/interceptors.dart';

class DioHelper {
  late Dio _dio;

  DioHelper() {
    createDio();
  }

  Dio get dio => _dio;

  void createDio() {
    _dio = Dio(createNewBaseOptions());
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LoggingInterceptor());
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }

  static const Duration timeoutDuration = Duration(seconds: 30);

  static BaseOptions createNewBaseOptions({
    String baseUrl = Apis.baseUrl,
    headers = const {
      "Accept": "application/json",
      'Content-Type': 'application/json',
    },
  }) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeoutDuration,
      receiveTimeout: timeoutDuration,
      responseType: ResponseType.plain,
      headers: headers,
      validateStatus: (status) {
        return true;
      },
    );
  }
}
