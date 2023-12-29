import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../di/injection.dart';
import '../../../../../helpers/hive_helper.dart';
import '../../../../../network/dio/enum.dart';
import '../../../../../network/dio/network_call.dart';
import '../../../../../network/urls/apis.dart';
import '../data/driver_details_entity.dart';

  class DriverDetailsRepository{

    Future<Either<String, DriverDetailsEntity>> getDriverOrders(String id) async {
      late Response response;
      response = await instance<NetworkCall>().request(
          Apis.getDriverOrders(id),
          options: Options(method: Method.get.name, headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper
                .getUserToken()}',
          }));

      if (response.statusCode == 200) {
        return Right(DriverDetailsEntity.fromJson(jsonDecode(response.data)));
      } else {
        return left(
            jsonDecode(response.data)['data']['message'] ?? 'empty_data'.tr);
      }
    }
}
