import 'dart:io';
import 'package:dio/dio.dart';
import '../../di/injection.dart';
import '../../network/dio/enum.dart';
import '../../network/dio/network_call.dart';
import '../../network/urls/apis.dart';
import '../hive_helper.dart';
import 'notifications_helper.dart';

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
        "fcmToken": await NotificationsHelper.getToken(),
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
        "fcmToken": newToken,
      },
    );
  }
}
