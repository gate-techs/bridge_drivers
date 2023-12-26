import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../di/injection.dart';
import '../../../helpers/hive_helper.dart';
import '../../../network/dio/enum.dart';
import '../../../network/dio/network_call.dart';
import '../../../network/urls/apis.dart';
import '../data/about_entity.dart';

class AboutRepository {
  Future<Either<String, AboutEntity>> getAbout(String pageName) async {
    late Response response;
    try {
      response =
          await instance<NetworkCall>().request(Apis.getPageWithSlug(pageName),
              options: Options(method: Method.get.name, headers: {
                'locale': HiveHelper.getAppLanguage(),
                HttpHeaders.authorizationHeader:
                    'Bearer ${HiveHelper.getUserToken()}'
              }));
    } on Exception catch (e) {
      return Left(e.toString());
    }
    return Right(AboutEntity.fromJson(jsonDecode(response.data)));
  }
}
