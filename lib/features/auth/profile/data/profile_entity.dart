import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/profile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProfileEntity {
	ProfileData? data;

	ProfileEntity();

	factory ProfileEntity.fromJson(Map<String, dynamic> json) => $ProfileEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProfileEntityToJson(this);

	ProfileEntity copyWith({ProfileData? data}) {
		return ProfileEntity()
			..data= data ?? this.data;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileData {
	bool? status;
	String? message;
	ProfileDataRows? rows;

	ProfileData();

	factory ProfileData.fromJson(Map<String, dynamic> json) => $ProfileDataFromJson(json);

	Map<String, dynamic> toJson() => $ProfileDataToJson(this);

	ProfileData copyWith({bool? status, String? message, ProfileDataRows? rows}) {
		return ProfileData()
			..status= status ?? this.status
			..message= message ?? this.message
			..rows= rows ?? this.rows;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileDataRows {
	int? id;
	dynamic avatar;
	String? name;
	String? email;
	String? mobile;

	ProfileDataRows();

	factory ProfileDataRows.fromJson(Map<String, dynamic> json) => $ProfileDataRowsFromJson(json);

	Map<String, dynamic> toJson() => $ProfileDataRowsToJson(this);

	ProfileDataRows copyWith({int? id, dynamic avatar, String? name, String? email, String? mobile}) {
		return ProfileDataRows()
			..id= id ?? this.id
			..avatar= avatar ?? this.avatar
			..name= name ?? this.name
			..email= email ?? this.email
			..mobile= mobile ?? this.mobile;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}