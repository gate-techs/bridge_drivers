import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/urls/apis.dart';

import '../data/profile_entity.dart';


class ProfileRerpository{

  Future<Either<String,ProfileEntity>> getProfile()async{
    late Response response;
    try {
      response = await instance<NetworkCall>().request(
          Apis.getProfileData,
          options: Options(method: Method.get.name, headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper.getUserToken()}',
            'locale': HiveHelper.getAppLanguage(),
          }));
    } on Exception catch (e) {
      return Left(e.toString());
    }
    return Right(ProfileEntity.fromJson(jsonDecode(response.data)));
  }
}