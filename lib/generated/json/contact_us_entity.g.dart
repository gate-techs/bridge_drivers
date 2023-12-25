import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/contact_us/data/contact_us_entity.dart';

ContactUsEntity $ContactUsEntityFromJson(Map<String, dynamic> json) {
  final ContactUsEntity contactUsEntity = ContactUsEntity();
  final ContactUsData? data = jsonConvert.convert<ContactUsData>(json['data']);
  if (data != null) {
    contactUsEntity.data = data;
  }
  return contactUsEntity;
}

Map<String, dynamic> $ContactUsEntityToJson(ContactUsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension ContactUsEntityExtension on ContactUsEntity {
  ContactUsEntity copyWith({
    ContactUsData? data,
  }) {
    return ContactUsEntity()
      ..data = data ?? this.data;
  }
}

ContactUsData $ContactUsDataFromJson(Map<String, dynamic> json) {
  final ContactUsData contactUsData = ContactUsData();
  final bool? status = jsonConvert.convert<bool>(json['status']);
  if (status != null) {
    contactUsData.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    contactUsData.message = message;
  }
  return contactUsData;
}

Map<String, dynamic> $ContactUsDataToJson(ContactUsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  return data;
}

extension ContactUsDataExtension on ContactUsData {
  ContactUsData copyWith({
    bool? status,
    String? message,
  }) {
    return ContactUsData()
      ..status = status ?? this.status
      ..message = message ?? this.message;
  }
}