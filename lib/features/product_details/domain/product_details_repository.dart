import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/features/product_details/data/product_details_response.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/errors/exceptions.dart';
import 'package:kishk_driver/network/urls/apis.dart';

class ProductDetailsRepository {
  Future<Either<String, ProductDetailsDataRows>> getProductDetailsData(
      int id) async {
    late Response response;
    try {
      response = await instance<NetworkCall>().request(
          Apis.getProductDetailsDataApiCall(id),
          options: Options(method: Method.get.name, headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ${HiveHelper.getUserToken()}'
          }));
      ProductDetailsResponse mProductDetailsResponse =
          ProductDetailsResponse.fromJson(jsonDecode(response.data));
      if (response.statusCode == 200 && mProductDetailsResponse.data != null) {
        return Right(mProductDetailsResponse.data!.rows!);
      } else {
        return Left("empty_data".tr);
      }
    } on SocketException {
      throw UnauthenticatedException('');
    }
  }
}
