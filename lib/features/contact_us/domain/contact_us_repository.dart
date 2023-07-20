import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/urls/apis.dart';

import '../data/contact_us_entity.dart';
import '../data/contact_us_erorr_entity.dart';



class ContactUsRepository{

  Future<Either<ContactUsErorrEntity,ContactUsEntity>> contactUs(Map<String,dynamic> params)async{
    late Response response;

    response = await instance<NetworkCall>().request(
        Apis.doContactUsApiCall,
        params: params,
        options: Options(method: Method.post.name,headers: {
          'locale': HiveHelper.getAppLanguage(),
          'Content-Type': 'application/json'
        }));
    if(response.statusCode == 201){
      return Right(ContactUsEntity.fromJson(jsonDecode(response.data)));
    }
    else{
      return Left(ContactUsErorrEntity.fromJson(jsonDecode(response.data)));
    }
  }
}