import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/profile_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/profile_entity.g.dart';

@JsonSerializable()
class ProfileEntity {
	ProfileData? data;

	ProfileEntity();

	factory ProfileEntity.fromJson(Map<String, dynamic> json) => $ProfileEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProfileEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileData {
	int? id;
	String? image;
	String? name;
	String? email;
	String? mobile;
	String? countryCode;

	ProfileData();

	factory ProfileData.fromJson(Map<String, dynamic> json) => $ProfileDataFromJson(json);

	Map<String, dynamic> toJson() => $ProfileDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}