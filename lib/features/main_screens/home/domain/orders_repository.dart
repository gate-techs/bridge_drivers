import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';

import '../../../../../di/injection.dart';
import '../../../../../helpers/hive_helper.dart';
import '../../../../../network/dio/enum.dart';
import '../../../../../network/dio/network_call.dart';
import '../../../../../network/errors/exceptions.dart';
import '../../../../../network/urls/apis.dart';
import '../data/orders_count_response.dart';
import '../data/orders_entity.dart';

class OrdersRepository {


  Future<Either<String, OrdersEntity>> getOrders(
      Map<String, dynamic> prams) async {
    late Response response;
    response = await instance<NetworkCall>().request(
        Apis.getOrders,
        queryParameters: prams,
        options: Options(method: Method.get.name, headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper
              .getUserToken()}',
        }));

    if (response.statusCode == 200) {
      return Right(OrdersEntity.fromJson(jsonDecode(response.data)));
    } else {
      return left(
          jsonDecode(response.data)['data']['message'] ?? 'empty_data'.tr);
    }
  }


  Future<Either<String, OrdersEntity>> getOrdersCount() async {
    late Response response;
    response = await instance<NetworkCall>().request(
        Apis.getOrdersCountApiCall,
        options: Options(method: Method.get.name, headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper
              .getUserToken()}',
        }));

    if (response.statusCode == 200) {
      return Right(OrdersEntity.fromJson(jsonDecode(response.data)));
    } else {
      return left(
          jsonDecode(response.data)['data']['message'] ?? 'empty_data'.tr);
    }
  }
}
