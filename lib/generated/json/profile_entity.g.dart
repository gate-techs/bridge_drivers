import 'package:kishk_driver/generated/json/base/json_convert_content.dart';

import '../../features/auth/profile/data/profile_entity.dart';


ProfileEntity $ProfileEntityFromJson(Map<String, dynamic> json) {
  final ProfileEntity profileEntity = ProfileEntity();
  final ProfileData? data = jsonConvert.convert<ProfileData>(json['data']);
  if (data != null) {
    profileEntity.data = data;
  }
  return profileEntity;
}

Map<String, dynamic> $ProfileEntityToJson(ProfileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

ProfileData $ProfileDataFromJson(Map<String, dynamic> json) {
  final ProfileData profileData = ProfileData();
  final bool? status = jsonConvert.convert<bool>(json['status']);
  if (status != null) {
    profileData.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    profileData.message = message;
  }
  final ProfileDataRows? rows =
      jsonConvert.convert<ProfileDataRows>(json['rows']);
  if (rows != null) {
    profileData.rows = rows;
  }
  return profileData;
}

Map<String, dynamic> $ProfileDataToJson(ProfileData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['rows'] = entity.rows?.toJson();
  return data;
}

ProfileDataRows $ProfileDataRowsFromJson(Map<String, dynamic> json) {
  final ProfileDataRows profileDataRows = ProfileDataRows();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    profileDataRows.id = id;
  }
  final dynamic avatar = jsonConvert.convert<dynamic>(json['avatar']);
  if (avatar != null) {
    profileDataRows.avatar = avatar;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    profileDataRows.name = name;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    profileDataRows.email = email;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    profileDataRows.mobile = mobile;
  }
  return profileDataRows;
}

Map<String, dynamic> $ProfileDataRowsToJson(ProfileDataRows entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['avatar'] = entity.avatar;
  data['name'] = entity.name;
  data['email'] = entity.email;
  data['mobile'] = entity.mobile;
  return data;
}
