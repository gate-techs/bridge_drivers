import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/urls/apis.dart';

import '../data/about_entity.dart';


class AboutRepository{
  Future<Either<String,AboutEntity>> about()async{
    late Response response;

    response = await instance<NetworkCall>().request(
        Apis.getAboutApiCall,
        queryParameters: {'locale': HiveHelper.getAppLanguage()},
        options: Options(method: Method.get.name));
    if(response.statusCode == 200){
      return Right(AboutEntity.fromJson(jsonDecode(response.data)));
    }
    else{
      return Left('unknown_error'.tr);
    }
  }
}