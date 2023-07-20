import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/contact_us_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ContactUsEntity {
	ContactUsData? data;

	ContactUsEntity();

	factory ContactUsEntity.fromJson(Map<String, dynamic> json) => $ContactUsEntityFromJson(json);

	Map<String, dynamic> toJson() => $ContactUsEntityToJson(this);

	ContactUsEntity copyWith({ContactUsData? data}) {
		return ContactUsEntity()
			..data= data ?? this.data;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ContactUsData {
	bool? status;
	String? message;

	ContactUsData();

	factory ContactUsData.fromJson(Map<String, dynamic> json) => $ContactUsDataFromJson(json);

	Map<String, dynamic> toJson() => $ContactUsDataToJson(this);

	ContactUsData copyWith({bool? status, String? message}) {
		return ContactUsData()
			..status= status ?? this.status
			..message= message ?? this.message;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}