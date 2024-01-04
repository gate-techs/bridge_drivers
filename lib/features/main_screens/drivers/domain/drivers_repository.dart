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
import 'package:kishk_driver/features/main_screens/drivers/data/drivers_entity.dart';

class DriversRepository {


  Future<Either<String, DriversEntity>> getDrivers(
      Map<String, dynamic> prams) async {
    late Response response;
    response = await instance<NetworkCall>().request(
        Apis.getDrivers,
        queryParameters: prams,
        options: Options(method: Method.get.name, headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper
              .getUserToken()}',
        }));

    if (response.statusCode == 200) {
      return Right(DriversEntity.fromJson(jsonDecode(response.data)));
    } else {
      return left(
          jsonDecode(response.data)['data']['message'] ?? 'empty_data'.tr);
    }
  }


}
