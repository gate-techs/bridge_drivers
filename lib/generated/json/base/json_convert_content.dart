// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:kishk_driver/country_code/data/country_code_entity.dart';
import 'package:kishk_driver/features/about/data/about_entity.dart';
import 'package:kishk_driver/features/contact_us/data/contact_us_entity.dart';
import 'package:kishk_driver/features/contact_us/data/contact_us_erorr_entity.dart';
import 'package:kishk_driver/features/main/data/badge_count_entity.dart';
import 'package:kishk_driver/features/main_screens/home/data/orders_entity.dart';
import 'package:kishk_driver/features/main_screens/profile/data/app_pages_entity.dart';
import 'package:kishk_driver/features/main_screens/profile/data/profile_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(value as Map<String, dynamic>) as T;
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<CountryCodeEntity>[] is M) {
      return data.map<CountryCodeEntity>((Map<String, dynamic> e) =>
          CountryCodeEntity.fromJson(e)).toList() as M;
    }
    if (<CountryCodeData>[] is M) {
      return data.map<CountryCodeData>((Map<String, dynamic> e) =>
          CountryCodeData.fromJson(e)).toList() as M;
    }
    if (<CountryCodeDataRows>[] is M) {
      return data.map<CountryCodeDataRows>((Map<String, dynamic> e) =>
          CountryCodeDataRows.fromJson(e)).toList() as M;
    }
    if (<AboutEntity>[] is M) {
      return data.map<AboutEntity>((Map<String, dynamic> e) =>
          AboutEntity.fromJson(e)).toList() as M;
    }
    if (<AboutData>[] is M) {
      return data.map<AboutData>((Map<String, dynamic> e) =>
          AboutData.fromJson(e)).toList() as M;
    }
    if (<AboutDataRow>[] is M) {
      return data.map<AboutDataRow>((Map<String, dynamic> e) =>
          AboutDataRow.fromJson(e)).toList() as M;
    }
    if (<ContactUsEntity>[] is M) {
      return data.map<ContactUsEntity>((Map<String, dynamic> e) =>
          ContactUsEntity.fromJson(e)).toList() as M;
    }
    if (<ContactUsData>[] is M) {
      return data.map<ContactUsData>((Map<String, dynamic> e) =>
          ContactUsData.fromJson(e)).toList() as M;
    }
    if (<ContactUsErorrEntity>[] is M) {
      return data.map<ContactUsErorrEntity>((Map<String, dynamic> e) =>
          ContactUsErorrEntity.fromJson(e)).toList() as M;
    }
    if (<ContactUsErorrErrors>[] is M) {
      return data.map<ContactUsErorrErrors>((Map<String, dynamic> e) =>
          ContactUsErorrErrors.fromJson(e)).toList() as M;
    }
    if (<BadgeCountEntity>[] is M) {
      return data.map<BadgeCountEntity>((Map<String, dynamic> e) =>
          BadgeCountEntity.fromJson(e)).toList() as M;
    }
    if (<BadgeCountData>[] is M) {
      return data.map<BadgeCountData>((Map<String, dynamic> e) =>
          BadgeCountData.fromJson(e)).toList() as M;
    }
    if (<OrdersEntity>[] is M) {
      return data.map<OrdersEntity>((Map<String, dynamic> e) =>
          OrdersEntity.fromJson(e)).toList() as M;
    }
    if (<OrdersData>[] is M) {
      return data.map<OrdersData>((Map<String, dynamic> e) =>
          OrdersData.fromJson(e)).toList() as M;
    }
    if (<OrdersDataRows>[] is M) {
      return data.map<OrdersDataRows>((Map<String, dynamic> e) =>
          OrdersDataRows.fromJson(e)).toList() as M;
    }
    if (<OrdersDataRowsCustomer>[] is M) {
      return data.map<OrdersDataRowsCustomer>((Map<String, dynamic> e) =>
          OrdersDataRowsCustomer.fromJson(e)).toList() as M;
    }
    if (<OrdersDataRowsDriver>[] is M) {
      return data.map<OrdersDataRowsDriver>((Map<String, dynamic> e) =>
          OrdersDataRowsDriver.fromJson(e)).toList() as M;
    }
    if (<OrdersDataPaginate>[] is M) {
      return data.map<OrdersDataPaginate>((Map<String, dynamic> e) =>
          OrdersDataPaginate.fromJson(e)).toList() as M;
    }
    if (<AppPagesEntity>[] is M) {
      return data.map<AppPagesEntity>((Map<String, dynamic> e) =>
          AppPagesEntity.fromJson(e)).toList() as M;
    }
    if (<AppPagesData>[] is M) {
      return data.map<AppPagesData>((Map<String, dynamic> e) =>
          AppPagesData.fromJson(e)).toList() as M;
    }
    if (<AppPagesDataRows>[] is M) {
      return data.map<AppPagesDataRows>((Map<String, dynamic> e) =>
          AppPagesDataRows.fromJson(e)).toList() as M;
    }
    if (<AppPagesDataRowsUser>[] is M) {
      return data.map<AppPagesDataRowsUser>((Map<String, dynamic> e) =>
          AppPagesDataRowsUser.fromJson(e)).toList() as M;
    }
    if (<AppPagesDataRowsEn>[] is M) {
      return data.map<AppPagesDataRowsEn>((Map<String, dynamic> e) =>
          AppPagesDataRowsEn.fromJson(e)).toList() as M;
    }
    if (<AppPagesDataRowsAr>[] is M) {
      return data.map<AppPagesDataRowsAr>((Map<String, dynamic> e) =>
          AppPagesDataRowsAr.fromJson(e)).toList() as M;
    }
    if (<AppPagesDataPaginate>[] is M) {
      return data.map<AppPagesDataPaginate>((Map<String, dynamic> e) =>
          AppPagesDataPaginate.fromJson(e)).toList() as M;
    }
    if (<AppPagesDataPermissions>[] is M) {
      return data.map<AppPagesDataPermissions>((Map<String, dynamic> e) =>
          AppPagesDataPermissions.fromJson(e)).toList() as M;
    }
    if (<ProfileEntity>[] is M) {
      return data.map<ProfileEntity>((Map<String, dynamic> e) =>
          ProfileEntity.fromJson(e)).toList() as M;
    }
    if (<ProfileData>[] is M) {
      return data.map<ProfileData>((Map<String, dynamic> e) =>
          ProfileData.fromJson(e)).toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (CountryCodeEntity).toString(): CountryCodeEntity.fromJson,
    (CountryCodeData).toString(): CountryCodeData.fromJson,
    (CountryCodeDataRows).toString(): CountryCodeDataRows.fromJson,
    (AboutEntity).toString(): AboutEntity.fromJson,
    (AboutData).toString(): AboutData.fromJson,
    (AboutDataRow).toString(): AboutDataRow.fromJson,
    (ContactUsEntity).toString(): ContactUsEntity.fromJson,
    (ContactUsData).toString(): ContactUsData.fromJson,
    (ContactUsErorrEntity).toString(): ContactUsErorrEntity.fromJson,
    (ContactUsErorrErrors).toString(): ContactUsErorrErrors.fromJson,
    (BadgeCountEntity).toString(): BadgeCountEntity.fromJson,
    (BadgeCountData).toString(): BadgeCountData.fromJson,
    (OrdersEntity).toString(): OrdersEntity.fromJson,
    (OrdersData).toString(): OrdersData.fromJson,
    (OrdersDataRows).toString(): OrdersDataRows.fromJson,
    (OrdersDataRowsCustomer).toString(): OrdersDataRowsCustomer.fromJson,
    (OrdersDataRowsDriver).toString(): OrdersDataRowsDriver.fromJson,
    (OrdersDataPaginate).toString(): OrdersDataPaginate.fromJson,
    (AppPagesEntity).toString(): AppPagesEntity.fromJson,
    (AppPagesData).toString(): AppPagesData.fromJson,
    (AppPagesDataRows).toString(): AppPagesDataRows.fromJson,
    (AppPagesDataRowsUser).toString(): AppPagesDataRowsUser.fromJson,
    (AppPagesDataRowsEn).toString(): AppPagesDataRowsEn.fromJson,
    (AppPagesDataRowsAr).toString(): AppPagesDataRowsAr.fromJson,
    (AppPagesDataPaginate).toString(): AppPagesDataPaginate.fromJson,
    (AppPagesDataPermissions).toString(): AppPagesDataPermissions.fromJson,
    (ProfileEntity).toString(): ProfileEntity.fromJson,
    (ProfileData).toString(): ProfileData.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}