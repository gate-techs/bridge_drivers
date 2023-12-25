import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/contact_us/data/contact_us_erorr_entity.dart';

ContactUsErorrEntity $ContactUsErorrEntityFromJson(Map<String, dynamic> json) {
  final ContactUsErorrEntity contactUsErorrEntity = ContactUsErorrEntity();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    contactUsErorrEntity.message = message;
  }
  final ContactUsErorrErrors? errors = jsonConvert.convert<
      ContactUsErorrErrors>(json['errors']);
  if (errors != null) {
    contactUsErorrEntity.errors = errors;
  }
  return contactUsErorrEntity;
}

Map<String, dynamic> $ContactUsErorrEntityToJson(ContactUsErorrEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message'] = entity.message;
  data['errors'] = entity.errors?.toJson();
  return data;
}

extension ContactUsErorrEntityExtension on ContactUsErorrEntity {
  ContactUsErorrEntity copyWith({
    String? message,
    ContactUsErorrErrors? errors,
  }) {
    return ContactUsErorrEntity()
      ..message = message ?? this.message
      ..errors = errors ?? this.errors;
  }
}

ContactUsErorrErrors $ContactUsErorrErrorsFromJson(Map<String, dynamic> json) {
  final ContactUsErorrErrors contactUsErorrErrors = ContactUsErorrErrors();
  final List<String>? email = (json['email'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (email != null) {
    contactUsErorrErrors.email = email;
  }
  return contactUsErorrErrors;
}

Map<String, dynamic> $ContactUsErorrErrorsToJson(ContactUsErorrErrors entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['email'] = entity.email;
  return data;
}

extension ContactUsErorrErrorsExtension on ContactUsErorrErrors {
  ContactUsErorrErrors copyWith({
    List<String>? email,
  }) {
    return ContactUsErorrErrors()
      ..email = email ?? this.email;
  }
}