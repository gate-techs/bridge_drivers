import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/drivers_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/drivers_entity.g.dart';

@JsonSerializable()
class DriversEntity {
	DriversData? data;

	DriversEntity();

	factory DriversEntity.fromJson(Map<String, dynamic> json) => $DriversEntityFromJson(json);

	Map<String, dynamic> toJson() => $DriversEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriversData {
	List<DriversDataRows>? rows;
	DriversDataPaginate? paginate;

	DriversData();

	factory DriversData.fromJson(Map<String, dynamic> json) => $DriversDataFromJson(json);

	Map<String, dynamic> toJson() => $DriversDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriversDataRows {
	int? id;
	DriversDataRowsMedia? media;
	String? name;
	String? mobile;
	int? totalOrders;
	List<DriversDataRowsOrders>? orders;

	DriversDataRows();

	factory DriversDataRows.fromJson(Map<String, dynamic> json) => $DriversDataRowsFromJson(json);

	Map<String, dynamic> toJson() => $DriversDataRowsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriversDataRowsMedia {
	String? type;
	String? url;

	DriversDataRowsMedia();

	factory DriversDataRowsMedia.fromJson(Map<String, dynamic> json) => $DriversDataRowsMediaFromJson(json);

	Map<String, dynamic> toJson() => $DriversDataRowsMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriversDataRowsOrders {
	int? id;
	String? encryptId;
	String? orderNo;
	DriversDataRowsOrdersCustomer? customer;
	DriversDataRowsOrdersDriver? driver;
	String? totalGrandPrice;
	int? totalQtyInOrder;
	bool? paid;
	bool? cancelled;
	String? orderedDate;
	String? dispatchedDate;
	String? shippedDate;
	String? deliveredDate;
	String? orderStatus;

	DriversDataRowsOrders();

	factory DriversDataRowsOrders.fromJson(Map<String, dynamic> json) => $DriversDataRowsOrdersFromJson(json);

	Map<String, dynamic> toJson() => $DriversDataRowsOrdersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriversDataRowsOrdersCustomer {
	String? name;

	DriversDataRowsOrdersCustomer();

	factory DriversDataRowsOrdersCustomer.fromJson(Map<String, dynamic> json) => $DriversDataRowsOrdersCustomerFromJson(json);

	Map<String, dynamic> toJson() => $DriversDataRowsOrdersCustomerToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriversDataRowsOrdersDriver {
	String? id;
	String? mobile;
	String? name;

	DriversDataRowsOrdersDriver();

	factory DriversDataRowsOrdersDriver.fromJson(Map<String, dynamic> json) => $DriversDataRowsOrdersDriverFromJson(json);

	Map<String, dynamic> toJson() => $DriversDataRowsOrdersDriverToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DriversDataPaginate {
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

	DriversDataPaginate();

	factory DriversDataPaginate.fromJson(Map<String, dynamic> json) => $DriversDataPaginateFromJson(json);

	Map<String, dynamic> toJson() => $DriversDataPaginateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}