import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../di/injection.dart';
import '../../helpers/hive_helper.dart';
import '../../network/dio/enum.dart';
import '../../network/dio/network_call.dart';
import '../../network/urls/apis.dart';
import '../data/country_code_entity.dart';

class CountryCodeRepository {
    Future<Either<String,CountryCodeEntity>> countryCode()async{
      late Response response;
      response = await instance<NetworkCall>().request(
          Apis.getCountryCodeData,
          options: Options(method: Method.get.name,headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper.getUserToken()}',
            'locale': HiveHelper.getAppLanguage(),
            'Content-Type': 'application/json'
          }));
      if(response.statusCode == 200){
        return  Right(CountryCodeEntity.fromJson(jsonDecode(response.data)));
      }
      else{
        return Left('empty_data'.tr);
      }
    }
}


