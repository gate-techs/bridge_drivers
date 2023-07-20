import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/logoutt_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LogouttEntity {
	bool? success;
	String? message;

	LogouttEntity();

	factory LogouttEntity.fromJson(Map<String, dynamic> json) => $LogouttEntityFromJson(json);

	Map<String, dynamic> toJson() => $LogouttEntityToJson(this);

	LogouttEntity copyWith({bool? success, String? message}) {
		return LogouttEntity()
			..success= success ?? this.success
			..message= message ?? this.message;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}