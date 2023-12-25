import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/auth/profile/data/profile_entity.dart';

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

extension ProfileEntityExtension on ProfileEntity {
  ProfileEntity copyWith({
    ProfileData? data,
  }) {
    return ProfileEntity()
      ..data = data ?? this.data;
  }
}

ProfileData $ProfileDataFromJson(Map<String, dynamic> json) {
  final ProfileData profileData = ProfileData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    profileData.id = id;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    profileData.image = image;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    profileData.name = name;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    profileData.email = email;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    profileData.mobile = mobile;
  }
  final String? countryCode = jsonConvert.convert<String>(json['countryCode']);
  if (countryCode != null) {
    profileData.countryCode = countryCode;
  }
  return profileData;
}

Map<String, dynamic> $ProfileDataToJson(ProfileData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['image'] = entity.image;
  data['name'] = entity.name;
  data['email'] = entity.email;
  data['mobile'] = entity.mobile;
  data['countryCode'] = entity.countryCode;
  return data;
}

extension ProfileDataExtension on ProfileData {
  ProfileData copyWith({
    int? id,
    String? image,
    String? name,
    String? email,
    String? mobile,
    String? countryCode,
  }) {
    return ProfileData()
      ..id = id ?? this.id
      ..image = image ?? this.image
      ..name = name ?? this.name
      ..email = email ?? this.email
      ..mobile = mobile ?? this.mobile
      ..countryCode = countryCode ?? this.countryCode;
  }
}