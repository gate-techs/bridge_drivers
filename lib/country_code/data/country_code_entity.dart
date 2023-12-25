import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/country_code_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/country_code_entity.g.dart';

@JsonSerializable()
class CountryCodeEntity {
	CountryCodeData? data;

	CountryCodeEntity();

	factory CountryCodeEntity.fromJson(Map<String, dynamic> json) => $CountryCodeEntityFromJson(json);

	Map<String, dynamic> toJson() => $CountryCodeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CountryCodeData {
	List<CountryCodeDataRows>? rows;

	CountryCodeData();

	factory CountryCodeData.fromJson(Map<String, dynamic> json) => $CountryCodeDataFromJson(json);

	Map<String, dynamic> toJson() => $CountryCodeDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CountryCodeDataRows {
	String? code;
	@JSONField(name: "iso_code")
	String? isoCode;

	CountryCodeDataRows();

	factory CountryCodeDataRows.fromJson(Map<String, dynamic> json) => $CountryCodeDataRowsFromJson(json);

	Map<String, dynamic> toJson() => $CountryCodeDataRowsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}