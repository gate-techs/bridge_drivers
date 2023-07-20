import 'package:dio/dio.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';

import '../urls/apis.dart';
import 'dio.dart';

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
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) async {
    if (newBaseUrl != null) {
      dioHelper.dio.options.baseUrl = newBaseUrl;
    } else {
      dioHelper.dio.options.baseUrl = Apis.baseUrl;
    }

    var response = await dioHelper.dio.request(url,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
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
        void Function(int, int)? onSendProgress,
      }) async {
    options.headers
        ?.addEntries({'locale': HiveHelper.getAppLanguage()}.entries);

    return await _request(
      url,
      newBaseUrl: newBaseUrl,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }

  // Stream requestStream<Response>(
  //   Method method,
  //   String url, {
  //   Function(int code, String msg)? onError,
  //   Map<String, dynamic>? params,
  //   Map<String, dynamic>? queryParameters,
  //   CancelToken? cancelToken,
  //   required Options options,
  //   Map<String, dynamic>? headers,
  // }) {
  //   return Stream.fromFuture(_request(url,
  //       data: params,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //       headers: headers));
  // }

  Future<Response> dioResponseHandler(Response<dynamic> response) async {
    return response;
  }
}
