import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../di/injection.dart';
import '../../../../helpers/hive_helper.dart';
import '../../../../network/dio/enum.dart';
import '../../../../network/dio/network_call.dart';
import '../../../../network/urls/apis.dart';


class EditProfileRepository{

  Future<Either<String,String>> editProfile(Map<String,dynamic> params)async{
    late Response response;

    response = await instance<NetworkCall>().request(
        Apis.getProfileApiCall,
        params: params,
        options: Options(method: Method.post.name,headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper.getUserToken()}',
          'locale': HiveHelper.getAppLanguage(),
          'Content-Type': 'application/json'
        }));
    if(response.statusCode == 200){
      return Right(jsonDecode(response.data)['message']?? 'empty_data'.tr);

    }
    else{
      return Left(jsonDecode(response.data)['message']?? 'empty_data'.tr);
    }
  }
}