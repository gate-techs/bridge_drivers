import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/about_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/about_entity.g.dart';

@JsonSerializable()
class AboutEntity {
	AboutData? data;

	AboutEntity();

	factory AboutEntity.fromJson(Map<String, dynamic> json) => $AboutEntityFromJson(json);

	Map<String, dynamic> toJson() => $AboutEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AboutData {
	AboutDataRow? row;

	AboutData();

	factory AboutData.fromJson(Map<String, dynamic> json) => $AboutDataFromJson(json);

	Map<String, dynamic> toJson() => $AboutDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AboutDataRow {
	int? id;
	String? image;
	String? title;
	String? body;

	AboutDataRow();

	factory AboutDataRow.fromJson(Map<String, dynamic> json) => $AboutDataRowFromJson(json);

	Map<String, dynamic> toJson() => $AboutDataRowToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}