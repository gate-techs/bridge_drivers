import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/about_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AboutEntity {
	AboutData? data;

	AboutEntity();

	factory AboutEntity.fromJson(Map<String, dynamic> json) => $AboutEntityFromJson(json);

	Map<String, dynamic> toJson() => $AboutEntityToJson(this);

	AboutEntity copyWith({AboutData? data}) {
		return AboutEntity()
			..data= data ?? this.data;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AboutData {
	bool? status;
	String? message;
	String? rows;

	AboutData();

	factory AboutData.fromJson(Map<String, dynamic> json) => $AboutDataFromJson(json);

	Map<String, dynamic> toJson() => $AboutDataToJson(this);

	AboutData copyWith({bool? status, String? message, String? rows}) {
		return AboutData()
			..status= status ?? this.status
			..message= message ?? this.message
			..rows= rows ?? this.rows;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}