import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/auth_data_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AuthDataEntity {
	AuthDataData? data;

	AuthDataEntity();

	factory AuthDataEntity.fromJson(Map<dynamic, dynamic> json) => $AuthDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $AuthDataEntityToJson(this);

	AuthDataEntity copyWith({AuthDataData? data}) {
		return AuthDataEntity()
			..data= data ?? this.data;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AuthDataData {
	bool? status;
	String? message;
	String? tokenType;
	String? accessToken;
	String? username;
	dynamic avatar;

	AuthDataData();

	factory AuthDataData.fromJson(Map<dynamic, dynamic> json) => $AuthDataDataFromJson(json);

	Map<String, dynamic> toJson() => $AuthDataDataToJson(this);

	AuthDataData copyWith({bool? status, String? message, String? tokenType, String? accessToken, String? username, dynamic avatar}) {
		return AuthDataData()
			..status= status ?? this.status
			..message= message ?? this.message
			..tokenType= tokenType ?? this.tokenType
			..accessToken= accessToken ?? this.accessToken
			..username= username ?? this.username
			..avatar= avatar ?? this.avatar;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}