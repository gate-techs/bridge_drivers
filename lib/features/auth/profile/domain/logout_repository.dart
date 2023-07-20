import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/urls/apis.dart';

import '../data/logoutt_entity.dart';



class LogoutRepository{

  Future<Either<LogouttEntity,LogouttEntity>> logout(Map<String,dynamic> params)async{
    late Response response;

    response = await instance<NetworkCall>().request(
        Apis.doLogoutApiCall,
        params: params,
        options: Options(method: Method.post.name,headers: {
        HttpHeaders.authorizationHeader:
        'Bearer ${HiveHelper.getUserToken()}',
          'locale': HiveHelper.getAppLanguage(),
          'Content-Type': 'application/json'
        }));
    if(response.statusCode == 200){
      return Right(LogouttEntity.fromJson(jsonDecode(response.data)));
    }
    else{
      return Left(LogouttEntity.fromJson(jsonDecode(response.data)));
    }
  }

  Future<Either<String,bool>> changePassword(Map<String,dynamic> params)async{
    late Response response;

    response = await instance<NetworkCall>().request(
        Apis.doChangePasswordApiCall,
        params: params,
        options: Options(method: Method.patch.name,headers: {
        HttpHeaders.authorizationHeader:
        'Bearer ${HiveHelper.getUserToken()}',
          'locale': HiveHelper.getAppLanguage(),
          'Content-Type': 'application/json'
        }));
    if(response.statusCode == 200){
      return Right(jsonDecode(response.data)['data']['status']);
    }
    else{
      return Left(jsonDecode(response.data)['data']['message']);
    }
  }
}

