import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/auth/login/data/auth_data_entity.dart';

AuthDataEntity $AuthDataEntityFromJson(Map<String, dynamic> json) {
  final AuthDataEntity authDataEntity = AuthDataEntity();
  final AuthDataData? data = jsonConvert.convert<AuthDataData>(json['data']);
  if (data != null) {
    authDataEntity.data = data;
  }
  return authDataEntity;
}

Map<String, dynamic> $AuthDataEntityToJson(AuthDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension AuthDataEntityExtension on AuthDataEntity {
  AuthDataEntity copyWith({
    AuthDataData? data,
  }) {
    return AuthDataEntity()
      ..data = data ?? this.data;
  }
}

AuthDataData $AuthDataDataFromJson(Map<String, dynamic> json) {
  final AuthDataData authDataData = AuthDataData();
  final AuthDataDataUserData? userData = jsonConvert.convert<
      AuthDataDataUserData>(json['userData']);
  if (userData != null) {
    authDataData.userData = userData;
  }
  final String? accessToken = jsonConvert.convert<String>(json['accessToken']);
  if (accessToken != null) {
    authDataData.accessToken = accessToken;
  }
  final List<
      AuthDataDataUserAbilities>? userAbilities = (json['userAbilities'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<AuthDataDataUserAbilities>(
          e) as AuthDataDataUserAbilities).toList();
  if (userAbilities != null) {
    authDataData.userAbilities = userAbilities;
  }
  return authDataData;
}

Map<String, dynamic> $AuthDataDataToJson(AuthDataData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userData'] = entity.userData?.toJson();
  data['accessToken'] = entity.accessToken;
  data['userAbilities'] = entity.userAbilities?.map((v) => v.toJson()).toList();
  return data;
}

extension AuthDataDataExtension on AuthDataData {
  AuthDataData copyWith({
    AuthDataDataUserData? userData,
    String? accessToken,
    List<AuthDataDataUserAbilities>? userAbilities,
  }) {
    return AuthDataData()
      ..userData = userData ?? this.userData
      ..accessToken = accessToken ?? this.accessToken
      ..userAbilities = userAbilities ?? this.userAbilities;
  }
}

AuthDataDataUserData $AuthDataDataUserDataFromJson(Map<String, dynamic> json) {
  final AuthDataDataUserData authDataDataUserData = AuthDataDataUserData();
  final String? encryptId = jsonConvert.convert<String>(json['encryptId']);
  if (encryptId != null) {
    authDataDataUserData.encryptId = encryptId;
  }
  final dynamic vendorId = json['vendorId'];
  if (vendorId != null) {
    authDataDataUserData.vendorId = vendorId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    authDataDataUserData.username = username;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    authDataDataUserData.email = email;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    authDataDataUserData.avatar = avatar;
  }
  final String? role = jsonConvert.convert<String>(json['role']);
  if (role != null) {
    authDataDataUserData.role = role;
  }
  return authDataDataUserData;
}

Map<String, dynamic> $AuthDataDataUserDataToJson(AuthDataDataUserData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['encryptId'] = entity.encryptId;
  data['vendorId'] = entity.vendorId;
  data['username'] = entity.username;
  data['email'] = entity.email;
  data['avatar'] = entity.avatar;
  data['role'] = entity.role;
  return data;
}

extension AuthDataDataUserDataExtension on AuthDataDataUserData {
  AuthDataDataUserData copyWith({
    String? encryptId,
    dynamic vendorId,
    String? username,
    String? email,
    String? avatar,
    String? role,
  }) {
    return AuthDataDataUserData()
      ..encryptId = encryptId ?? this.encryptId
      ..vendorId = vendorId ?? this.vendorId
      ..username = username ?? this.username
      ..email = email ?? this.email
      ..avatar = avatar ?? this.avatar
      ..role = role ?? this.role;
  }
}

AuthDataDataUserAbilities $AuthDataDataUserAbilitiesFromJson(
    Map<String, dynamic> json) {
  final AuthDataDataUserAbilities authDataDataUserAbilities = AuthDataDataUserAbilities();
  final String? action = jsonConvert.convert<String>(json['action']);
  if (action != null) {
    authDataDataUserAbilities.action = action;
  }
  final String? subject = jsonConvert.convert<String>(json['subject']);
  if (subject != null) {
    authDataDataUserAbilities.subject = subject;
  }
  return authDataDataUserAbilities;
}

Map<String, dynamic> $AuthDataDataUserAbilitiesToJson(
    AuthDataDataUserAbilities entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['action'] = entity.action;
  data['subject'] = entity.subject;
  return data;
}

extension AuthDataDataUserAbilitiesExtension on AuthDataDataUserAbilities {
  AuthDataDataUserAbilities copyWith({
    String? action,
    String? subject,
  }) {
    return AuthDataDataUserAbilities()
      ..action = action ?? this.action
      ..subject = subject ?? this.subject;
  }
}