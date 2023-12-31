import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../di/injection.dart';
import '../../../../../helpers/hive_helper.dart';
import '../../../../../network/dio/enum.dart';
import '../../../../../network/dio/network_call.dart';
import '../../../../../network/errors/exceptions.dart';
import '../../../../../network/urls/apis.dart';
import '../data/notification_badge_count.dart';
import '../data/notifications_entity.dart';


class NotificationsRepository {
  Future<Either<int, int>> getNotificationsCount() async {
    late Response response;
    try {
      response = await instance<NetworkCall>().request(
          Apis.getBadgeCountData,
          options: Options(method: Method.get.name, headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ${HiveHelper.getUserToken()}'
          }));
      NotificationBadgeCount mNotificationBadgeCount =
          NotificationBadgeCount.fromJson(jsonDecode(response.data));
      if (response.statusCode == 200 && mNotificationBadgeCount.data != null) {
        return Right(mNotificationBadgeCount.data?.count ?? 0);
      } else {
        return const Left(0);
      }
    } on SocketException {
      throw UnauthenticatedException('');
    }
  }




  Future<Either<String, NotificationsEntity>> getNotifications(
      Map<String, dynamic> prams) async {
    late Response response;
    response = await instance<NetworkCall>().request(
        Apis.getNotificationsData,
        queryParameters: prams,
        options: Options(method: Method.get.name, headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${HiveHelper
              .getUserToken()}',
        }));

    if (response.statusCode == 200) {
      return Right(NotificationsEntity.fromJson(jsonDecode(response.data)));
    } else {
      return left(
          jsonDecode(response.data)['data']['message'] ?? 'empty_data'.tr);
    }
  }





}
