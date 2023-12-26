import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/app_pages_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/app_pages_entity.g.dart';

@JsonSerializable()
class AppPagesEntity {
	AppPagesData? data;

	AppPagesEntity();

	factory AppPagesEntity.fromJson(Map<String, dynamic> json) => $AppPagesEntityFromJson(json);

	Map<String, dynamic> toJson() => $AppPagesEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppPagesData {
	List<AppPagesDataRows>? rows;
	AppPagesDataPaginate? paginate;
	AppPagesDataPermissions? permissions;

	AppPagesData();

	factory AppPagesData.fromJson(Map<String, dynamic> json) => $AppPagesDataFromJson(json);

	Map<String, dynamic> toJson() => $AppPagesDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppPagesDataRows {
	int? id;
	String? encryptId;
	String? image;
	AppPagesDataRowsUser? user;
	int? sort;
	String? status;
	String? date;
	AppPagesDataRowsEn? en;
	AppPagesDataRowsAr? ar;

	AppPagesDataRows();

	factory AppPagesDataRows.fromJson(Map<String, dynamic> json) => $AppPagesDataRowsFromJson(json);

	Map<String, dynamic> toJson() => $AppPagesDataRowsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppPagesDataRowsUser {
	String? image;
	String? name;

	AppPagesDataRowsUser();

	factory AppPagesDataRowsUser.fromJson(Map<String, dynamic> json) => $AppPagesDataRowsUserFromJson(json);

	Map<String, dynamic> toJson() => $AppPagesDataRowsUserToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppPagesDataRowsEn {
	String? tinyTitle;
	String? title;
	String? body;

	AppPagesDataRowsEn();

	factory AppPagesDataRowsEn.fromJson(Map<String, dynamic> json) => $AppPagesDataRowsEnFromJson(json);

	Map<String, dynamic> toJson() => $AppPagesDataRowsEnToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppPagesDataRowsAr {
	String? tinyTitle;
	String? title;
	String? body;

	AppPagesDataRowsAr();

	factory AppPagesDataRowsAr.fromJson(Map<String, dynamic> json) => $AppPagesDataRowsArFromJson(json);

	Map<String, dynamic> toJson() => $AppPagesDataRowsArToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppPagesDataPaginate {
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

	AppPagesDataPaginate();

	factory AppPagesDataPaginate.fromJson(Map<String, dynamic> json) => $AppPagesDataPaginateFromJson(json);

	Map<String, dynamic> toJson() => $AppPagesDataPaginateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppPagesDataPermissions {
	bool? read;
	bool? create;
	bool? update;
	bool? delete;

	AppPagesDataPermissions();

	factory AppPagesDataPermissions.fromJson(Map<String, dynamic> json) => $AppPagesDataPermissionsFromJson(json);

	Map<String, dynamic> toJson() => $AppPagesDataPermissionsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}