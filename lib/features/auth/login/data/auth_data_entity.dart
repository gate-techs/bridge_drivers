import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/auth_data_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/auth_data_entity.g.dart';

@JsonSerializable()
class AuthDataEntity {
	AuthDataData? data;

	AuthDataEntity();

	factory AuthDataEntity.fromJson(Map<String, dynamic> json) => $AuthDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $AuthDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AuthDataData {
	AuthDataDataUserData? userData;
	String? accessToken;
	List<AuthDataDataUserAbilities>? userAbilities;

	AuthDataData();

	factory AuthDataData.fromJson(Map<String, dynamic> json) => $AuthDataDataFromJson(json);

	Map<String, dynamic> toJson() => $AuthDataDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AuthDataDataUserData {
	String? encryptId;
	dynamic vendorId;
	String? username;
	String? email;
	String? avatar;
	String? role;

	AuthDataDataUserData();

	factory AuthDataDataUserData.fromJson(Map<String, dynamic> json) => $AuthDataDataUserDataFromJson(json);

	Map<String, dynamic> toJson() => $AuthDataDataUserDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AuthDataDataUserAbilities {
	String? action;
	String? subject;

	AuthDataDataUserAbilities();

	factory AuthDataDataUserAbilities.fromJson(Map<String, dynamic> json) => $AuthDataDataUserAbilitiesFromJson(json);

	Map<String, dynamic> toJson() => $AuthDataDataUserAbilitiesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}