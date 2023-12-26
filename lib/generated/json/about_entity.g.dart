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
  final AboutDataRow? row = jsonConvert.convert<AboutDataRow>(json['row']);
  if (row != null) {
    aboutData.row = row;
  }
  return aboutData;
}

Map<String, dynamic> $AboutDataToJson(AboutData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['row'] = entity.row?.toJson();
  return data;
}

extension AboutDataExtension on AboutData {
  AboutData copyWith({
    AboutDataRow? row,
  }) {
    return AboutData()
      ..row = row ?? this.row;
  }
}

AboutDataRow $AboutDataRowFromJson(Map<String, dynamic> json) {
  final AboutDataRow aboutDataRow = AboutDataRow();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    aboutDataRow.id = id;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    aboutDataRow.image = image;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    aboutDataRow.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    aboutDataRow.body = body;
  }
  return aboutDataRow;
}

Map<String, dynamic> $AboutDataRowToJson(AboutDataRow entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['image'] = entity.image;
  data['title'] = entity.title;
  data['body'] = entity.body;
  return data;
}

extension AboutDataRowExtension on AboutDataRow {
  AboutDataRow copyWith({
    int? id,
    String? image,
    String? title,
    String? body,
  }) {
    return AboutDataRow()
      ..id = id ?? this.id
      ..image = image ?? this.image
      ..title = title ?? this.title
      ..body = body ?? this.body;
  }
}