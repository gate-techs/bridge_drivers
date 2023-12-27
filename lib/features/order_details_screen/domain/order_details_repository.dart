import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../di/injection.dart';
import '../../../../helpers/hive_helper.dart';
import '../../../../network/dio/enum.dart';
import '../../../../network/dio/network_call.dart';
import '../../../../network/urls/apis.dart';
import '../data/order_details_entity.dart';



class OrderDetailsRepository{

  Future<Either<String,OrderDetailsEntity>> getOrderDetails(String id)async{
    late Response response;
    try {
      response = await instance<NetworkCall>().request(
          Apis.getOrderDetailsDataApiCall(id),
          options: Options(method: Method.get.name, headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper.getUserToken()}',
            'locale': HiveHelper.getAppLanguage(),
          }));
    } on Exception catch (e) {
      return Left(e.toString());
    }
    return Right(OrderDetailsEntity.fromJson(jsonDecode(response.data)));
  }
}