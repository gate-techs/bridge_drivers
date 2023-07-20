import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/di/injection.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/network/dio/enum.dart';
import 'package:kishk_driver/network/dio/network_call.dart';
import 'package:kishk_driver/network/errors/exceptions.dart';
import 'package:kishk_driver/network/urls/apis.dart';

import '../data/my_profile_response.dart';

class EditProfileRepository {
  Future<Either<String, MyProfileData>> updateProfileApiCall(
      FormData data) async {
    late Response response;
    try {
      response = await instance<NetworkCall>().request(Apis.getProfileData,
          params: data,
          options: Options(method: Method.post.name, headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ${HiveHelper.getUserToken()}',
            HttpHeaders.contentTypeHeader: 'multipart/form-data'
          }));
      MyProfileResponse mMyProfileResponse =
          MyProfileResponse.fromJson(jsonDecode(response.data));
      if (response.statusCode == 200 && mMyProfileResponse.data != null) {
        return Right(mMyProfileResponse.data!);
      } else {
        return Left("empty_data".tr);
      }
    } on SocketException {
      throw UnauthenticatedException('');
    }
  }
}
