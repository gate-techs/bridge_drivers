import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/urls/apis.dart';






class ChangeOrderStatusRepository{

  Future<Either<String,String>> changeOrderStatus(String status, String shoppingCartId)async{
    late Response response;
    response = await instance<NetworkCall>().request(
        status=='dispatched'?
        Apis.changeOrderToDispatched: status=='shipped'?
        Apis.changeOrderToShipped: Apis.changeOrderToDelivered,
        params: {
          "shoppingCartId": shoppingCartId
        },
        options: Options(method: Method.post.name,headers: {
          'locale': HiveHelper.getAppLanguage(),
          'Content-Type': 'application/json'
        }));
    if(response.statusCode == 200){
      return Right(jsonDecode(response.data)['error']?? 'empty_data'.tr);
    }
    else{
      return Left(jsonDecode(response.data)['error']?? 'empty_data'.tr);
    }
  }
}