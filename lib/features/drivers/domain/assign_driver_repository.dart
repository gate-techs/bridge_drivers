import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/urls/apis.dart';






class AssignDriverRepository{

  Future<Either<String,String>> assignDriver(String orderId, String driverId)async{
    late Response response;
    response = await instance<NetworkCall>().request(
       Apis.assignDriver,
        params: {
          "orderId": orderId,
          "driverId": driverId,
        },
        options: Options(method: Method.post.name,headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper.getUserToken()}',
          'locale': HiveHelper.getAppLanguage(),
          'Content-Type': 'application/json'
        }));
    if(response.statusCode == 200){
      return Right(jsonDecode(response.data)['data']['message']?? 'empty_data'.tr);
    }
    else{
      return Left(jsonDecode(response.data)['data']['message']?? 'empty_data'.tr);
    }
  }
}