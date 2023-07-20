import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';

import '../../../../../di/injection.dart';
import '../../../../../helpers/hive_helper.dart';
import '../../../../../network/dio/enum.dart';
import '../../../../../network/dio/network_call.dart';
import '../../../../../network/errors/exceptions.dart';
import '../../../../../network/urls/apis.dart';
import '../../home/data/my_orders_response.dart';

class SearchRepository {
  Future<Either<String, List<MyOrdersDataRows>>> getSearchData(
      {String searchKeyWord = '',
      int pageIndex = 1,
      int paginate = 10,
      OrdersStatus? status}) async {
    late Response response;

    try {
      response = await instance<NetworkCall>().request(
          Apis.getOrdersDataApiCall,
          queryParameters: {
            if (searchKeyWord.isNotEmpty) 'search': searchKeyWord,
            if (status != null) 'status': status.value,
            'paginate': paginate,
            'page': pageIndex,
          },
          options: Options(method: Method.get.name, headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ${HiveHelper.getUserToken()}'
          }));

      MyOrdersResponse mMyOrdersResponse =
          MyOrdersResponse.fromJson(jsonDecode(response.data));
      if (response.statusCode == 200 && mMyOrdersResponse.data != null) {
        return Right(mMyOrdersResponse.data!.rows!);
      } else {
        return Left("empty_data".tr);
      }
    } on SocketException {
      throw UnauthenticatedException('');
    }
  }
}
