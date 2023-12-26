import 'package:dio/dio.dart';
import '../../common_utils/app_constants.dart';
import '../../helpers/hive_helper.dart';
import 'dio.dart';
import 'enum.dart';

class NetworkCall {
  DioHelper dioHelper;

  NetworkCall({required this.dioHelper});

  Future<Response> _request<T>(String url,
      {dynamic data,
        String? newBaseUrl,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        required Options options,
        Map<String, dynamic>? headers,
        void Function(int, int)? onSendProgress}) async {
    if (headers != null) {
      dioHelper.dio.options.headers = headers;
    }
    if (newBaseUrl != null) {
      dioHelper.dio.options.baseUrl = newBaseUrl;
    } else {
      dioHelper.dio.options.baseUrl = appCurrentBaseUrl;
    }

    var response = await dioHelper.dio.request(url,
        onSendProgress: onSendProgress,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);

    return dioResponseHandler(response);
  }

  Future<Response> request(
      String url, {
        String? newBaseUrl,
        dynamic params,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        required Options options,
      }) async {
    return await _request(
      url,
      newBaseUrl: newBaseUrl,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Stream requestStream<Response>(
      Method method,
      String url, {
        Function(int code, String msg)? onError,
        Map<String, dynamic>? params,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        required Options options,
        Map<String, dynamic>? headers,
      }) {
    return Stream.fromFuture(_request(url,
        data: params,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        headers: headers));
  }

  Future<Response> dioResponseHandler(Response<dynamic> response) async {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 400:
      case 401:
      case 402:
      case 403:
        HiveHelper.clearUserData();
        return response;
      default:
        return response;
    }
  }
}

