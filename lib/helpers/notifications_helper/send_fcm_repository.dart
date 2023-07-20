import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/urls/apis.dart';

 import '../hive_helper.dart';
import 'notification_helper.dart';

class SendFcmRepository {
  Future<void> sendFcmToken() async {
    await instance<NetworkCall>().request(
      Apis.sendFcmToken,
      options: Options(
        method: Method.post.name,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
          'Bearer ${HiveHelper.getUserToken()}',
        },
      ),
      params: {
        "fcm_token": await NotificationsHelper.getToken(),
      },
    );
  }

  Future<void> updateFcmToken(String newToken) async {
    await instance<NetworkCall>().request(
      Apis.sendFcmToken,
      options: Options(
        method: Method.post.name,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
          'Bearer ${HiveHelper.getUserToken()}',
        },
      ),
      params: {
        "fcm_token": newToken,
      },
    );
  }
}
