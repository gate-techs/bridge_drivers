import 'dart:io';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/features/invoice_screen/data/invoice_entity.dart';
import '../../../../di/injection.dart';
import '../../../../network/dio/enum.dart';
import '../../../../network/dio/network_call.dart';
import '../../../common_utils/log_utils.dart';
import '../../../helpers/hive_helper.dart';
import '../../../network/urls/apis.dart';


class InvoiceRepository{

  Future<Either<String,InvoiceEntity>> getInvoice(String id)async{
    Log.e('id:3    $id');
    late Response response;
    response = await instance<NetworkCall>().request(
      Apis.getInvoice ,
      params: {
        "orderId":id,
      },
      options: Options(method: Method.post.name, headers: {
      HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper
          .getUserToken()}',
    }));

    if(response.statusCode==200){
      return Right(InvoiceEntity.fromJson(jsonDecode(response.data)));
    }else{
      return left(jsonDecode(response.data)['data']['message']?? 'empty_data'.tr);

    }
  }
}