import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../common_utils/log_utils.dart';
import '../../helpers/hive_helper.dart';
import '../dio_inter/interceptors.dart';
import '../urls/apis.dart';

class DioHelper {
  late Dio _dio;

  DioHelper({String? appUrl, String? appId}) {
    createDio(appUrl: appUrl, appId: appId);
  }

  Dio get dio => _dio;

  void createDio({String? appUrl, String? appId}) {
    _dio = Dio(createNewBaseOptions(appUrl ?? Apis.baseUrl, {
      'locale': HiveHelper.getAppLanguage(),
      'appId': appId ?? Apis.appId,
      "Accept": "application/json",
    }));
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

  static BaseOptions createNewBaseOptions(
      String baseUrl, Map<String, dynamic> headers) {
    Duration timeOutDuration = const Duration(seconds: 25);
    Log.e('baseUrlbaseUrl${baseUrl.toString()}');
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeOutDuration,
      receiveTimeout: timeOutDuration,
      responseType: ResponseType.plain,
      headers: headers,
      validateStatus: (status) {
        return true;
      },
    );
  }
}
