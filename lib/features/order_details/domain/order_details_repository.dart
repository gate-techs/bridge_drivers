import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/urls/apis.dart';

import '../../../network/errors/exceptions.dart';
import '../data/order_details_response.dart';

class OrderDetailsRepository {
  Future<Either<String, OrderDetailsData>> getOrderDetailsData(int id) async {
    late Response response;
    try {
      response = await instance<NetworkCall>().request(
          Apis.getOrderDetailsDataApiCall(id),
          options: Options(method: Method.get.name, headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ${HiveHelper.getUserToken()}'
          }));
      OrderDetailsResponse mOrderDetailsResponse =
          OrderDetailsResponse.fromJson(jsonDecode(response.data));
      if (response.statusCode == 200 && mOrderDetailsResponse.data != null) {
        return Right(mOrderDetailsResponse.data!);
      } else {
        return Left("empty_data".tr);
      }
    } on SocketException {
      throw UnauthenticatedException('');
    }
  }

  Future<Either<String, bool>> updateOrderStatusData(
      int id, OrdersStatus status) async {
    late Response response;
    try {
      response = await instance<NetworkCall>().request(
          Apis.updateOrderStatusApiCall(id),
          params: {'_method': 'PATCH', 'status': status.value},
          options: Options(method: Method.post.name, headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ${HiveHelper.getUserToken()}'
          }));

      if (response.statusCode == 200) {
        return Right(jsonDecode(response.data)['data']['status']);
      } else {
        return Left(jsonDecode(response.data)['data']['message']);
      }
    } on SocketException {
      throw UnauthenticatedException('');
    }
  }
}
