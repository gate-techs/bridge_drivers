import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di/injection.dart';
import '../../../events/bus_events.dart';
import '../../../helpers/hive_helper.dart';
import '../../../network/dio/enum.dart';
import '../../../network/dio/network_call.dart';
import '../../../network/urls/apis.dart';


class SeeNotificationsRepository{

  Future<Either<String,String>> seeNotifications()async{
    late Response response;

      response = await instance<NetworkCall>().request(
          Apis.seeNotifications,
          options: Options(method: Method.post.name, headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper.getUserToken()}',
            'locale': HiveHelper.getAppLanguage(),
          }));
    if(response.statusCode == 200){
      eventBus.fire(const NotificationsEventBus());
      return Right(jsonDecode(response.data)['data']['message'] );
    }
    else{
      return  Left(jsonDecode(response.data)['data']['message']);
    }

  }
}
