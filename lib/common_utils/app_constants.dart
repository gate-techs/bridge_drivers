
import '../network/urls/apis.dart';

enum AppLanguages { ar, en }

final List<AppLanguages> dropDownApLanguages = [
  AppLanguages.ar,
  AppLanguages.en
];

enum UserTypes {
  customer,
  staff,
  owner,
  serviceProvider,
}

enum ComeFromLocation { login, register, forgetPassword }

final List<UserTypes> dropDownUserTypesItems = [
  UserTypes.owner,
  UserTypes.staff,
  UserTypes.serviceProvider,
  UserTypes.customer,
];

String appCurrentBaseUrl = Apis.baseUrl;
String appCurrentAppId = Apis.appId;
String appCurrentGooglePlayId = 'com.gatetechs.kishk.driver';
String appCurrentAppStoreId = '6450512301';
