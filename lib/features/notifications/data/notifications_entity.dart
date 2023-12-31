import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/notifications_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/notifications_entity.g.dart';

@JsonSerializable()
class NotificationsEntity {
	NotificationsData? data;

	NotificationsEntity();

	factory NotificationsEntity.fromJson(Map<String, dynamic> json) => $NotificationsEntityFromJson(json);

	Map<String, dynamic> toJson() => $NotificationsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NotificationsData {
	List<NotificationsDataRows>? rows;
	NotificationsDataPaginate? paginate;

	NotificationsData();

	factory NotificationsData.fromJson(Map<String, dynamic> json) => $NotificationsDataFromJson(json);

	Map<String, dynamic> toJson() => $NotificationsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NotificationsDataRows {
	int? id;
	NotificationsDataRowsMedia? media;
	String? module;
	String? modelId;
	String? title;
	dynamic body;
	bool? seen;
	String? date;
	String? diffForHumans;

	NotificationsDataRows();

	factory NotificationsDataRows.fromJson(Map<String, dynamic> json) => $NotificationsDataRowsFromJson(json);

	Map<String, dynamic> toJson() => $NotificationsDataRowsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NotificationsDataRowsMedia {
	String? type;
	String? url;

	NotificationsDataRowsMedia();

	factory NotificationsDataRowsMedia.fromJson(Map<String, dynamic> json) => $NotificationsDataRowsMediaFromJson(json);

	Map<String, dynamic> toJson() => $NotificationsDataRowsMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NotificationsDataPaginate {
	@JSONField(name: "current_page")
	int? currentPage;
	@JSONField(name: "first_page_url")
	String? firstPageUrl;
	int? from;
	@JSONField(name: "last_page")
	int? lastPage;
	@JSONField(name: "last_page_url")
	String? lastPageUrl;
	@JSONField(name: "next_page_url")
	dynamic nextPageUrl;
	String? path;
	@JSONField(name: "per_page")
	int? perPage;
	@JSONField(name: "prev_page_url")
	dynamic prevPageUrl;
	int? to;
	int? total;

	NotificationsDataPaginate();

	factory NotificationsDataPaginate.fromJson(Map<String, dynamic> json) => $NotificationsDataPaginateFromJson(json);

	Map<String, dynamic> toJson() => $NotificationsDataPaginateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}