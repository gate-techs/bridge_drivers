import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/badge_count_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/badge_count_entity.g.dart';

@JsonSerializable()
class BadgeCountEntity {
	BadgeCountData? data;

	BadgeCountEntity();

	factory BadgeCountEntity.fromJson(Map<String, dynamic> json) => $BadgeCountEntityFromJson(json);

	Map<String, dynamic> toJson() => $BadgeCountEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BadgeCountData {
	int? badgeCount;

	BadgeCountData();

	factory BadgeCountData.fromJson(Map<String, dynamic> json) => $BadgeCountDataFromJson(json);

	Map<String, dynamic> toJson() => $BadgeCountDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}