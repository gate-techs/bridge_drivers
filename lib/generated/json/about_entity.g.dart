import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/about/data/about_entity.dart';

AboutEntity $AboutEntityFromJson(Map<String, dynamic> json) {
  final AboutEntity aboutEntity = AboutEntity();
  final AboutData? data = jsonConvert.convert<AboutData>(json['data']);
  if (data != null) {
    aboutEntity.data = data;
  }
  return aboutEntity;
}

Map<String, dynamic> $AboutEntityToJson(AboutEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension AboutEntityExtension on AboutEntity {
  AboutEntity copyWith({
    AboutData? data,
  }) {
    return AboutEntity()
      ..data = data ?? this.data;
  }
}

AboutData $AboutDataFromJson(Map<String, dynamic> json) {
  final AboutData aboutData = AboutData();
  final bool? status = jsonConvert.convert<bool>(json['status']);
  if (status != null) {
    aboutData.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    aboutData.message = message;
  }
  final String? rows = jsonConvert.convert<String>(json['rows']);
  if (rows != null) {
    aboutData.rows = rows;
  }
  return aboutData;
}

Map<String, dynamic> $AboutDataToJson(AboutData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['rows'] = entity.rows;
  return data;
}

extension AboutDataExtension on AboutData {
  AboutData copyWith({
    bool? status,
    String? message,
    String? rows,
  }) {
    return AboutData()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..rows = rows ?? this.rows;
  }
}