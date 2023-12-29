import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/driver_details_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/driver_details_entity.g.dart';

@JsonSerializable()
class DriverDetailsEntity {
	DriverDetailsData? data;

	DriverDetailsEntity();

	factory DriverDetailsEntity.fromJson(Map<String, dynamic> json) => $DriverDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => $DriverDetailsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriverDetailsData {
	List<DriverDetailsDataRows>? rows;
	DriverDetailsDataPaginate? paginate;

	DriverDetailsData();

	factory DriverDetailsData.fromJson(Map<String, dynamic> json) => $DriverDetailsDataFromJson(json);

	Map<String, dynamic> toJson() => $DriverDetailsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriverDetailsDataRows {
	String? id;
	String? encryptId;
	String? orderNo;
	DriverDetailsDataRowsCustomer? customer;
	DriverDetailsDataRowsDriver? driver;
	String? totalGrandPrice;
	int? totalQtyInOrder;
	bool? paid;
	bool? cancelled;
	String? orderedDate;
	String? dispatchedDate;
	String? shippedDate;
	String? deliveredDate;
	String? orderStatus;

	DriverDetailsDataRows();

	factory DriverDetailsDataRows.fromJson(Map<String, dynamic> json) => $DriverDetailsDataRowsFromJson(json);

	Map<String, dynamic> toJson() => $DriverDetailsDataRowsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriverDetailsDataRowsCustomer {
	String? name;

	DriverDetailsDataRowsCustomer();

	factory DriverDetailsDataRowsCustomer.fromJson(Map<String, dynamic> json) => $DriverDetailsDataRowsCustomerFromJson(json);

	Map<String, dynamic> toJson() => $DriverDetailsDataRowsCustomerToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriverDetailsDataRowsDriver {
	String? id;
	dynamic mobile;
	dynamic name;

	DriverDetailsDataRowsDriver();

	factory DriverDetailsDataRowsDriver.fromJson(Map<String, dynamic> json) => $DriverDetailsDataRowsDriverFromJson(json);

	Map<String, dynamic> toJson() => $DriverDetailsDataRowsDriverToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriverDetailsDataPaginate {
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

	DriverDetailsDataPaginate();

	factory DriverDetailsDataPaginate.fromJson(Map<String, dynamic> json) => $DriverDetailsDataPaginateFromJson(json);

	Map<String, dynamic> toJson() => $DriverDetailsDataPaginateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}