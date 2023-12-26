import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/orders_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/orders_entity.g.dart';

@JsonSerializable()
class OrdersEntity {
	OrdersData? data;

	OrdersEntity();

	factory OrdersEntity.fromJson(Map<String, dynamic> json) => $OrdersEntityFromJson(json);

	Map<String, dynamic> toJson() => $OrdersEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrdersData {
	List<OrdersDataRows>? rows;
	OrdersDataPaginate? paginate;

	OrdersData();

	factory OrdersData.fromJson(Map<String, dynamic> json) => $OrdersDataFromJson(json);

	Map<String, dynamic> toJson() => $OrdersDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrdersDataRows {
	int? id;
	String? orderNo;
	OrdersDataRowsCustomer? customer;
	OrdersDataRowsDriver? driver;
	String? totalGrandPrice;
	bool? cancelled;
	String? orderedDate;
	String? orderStatus;

	OrdersDataRows();

	factory OrdersDataRows.fromJson(Map<String, dynamic> json) => $OrdersDataRowsFromJson(json);

	Map<String, dynamic> toJson() => $OrdersDataRowsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrdersDataRowsCustomer {
	String? name;

	OrdersDataRowsCustomer();

	factory OrdersDataRowsCustomer.fromJson(Map<String, dynamic> json) => $OrdersDataRowsCustomerFromJson(json);

	Map<String, dynamic> toJson() => $OrdersDataRowsCustomerToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrdersDataRowsDriver {
	String? id;
	String? mobile;
	String? name;

	OrdersDataRowsDriver();

	factory OrdersDataRowsDriver.fromJson(Map<String, dynamic> json) => $OrdersDataRowsDriverFromJson(json);

	Map<String, dynamic> toJson() => $OrdersDataRowsDriverToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrdersDataPaginate {
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
	String? perPage;
	@JSONField(name: "prev_page_url")
	dynamic prevPageUrl;
	int? to;
	int? total;

	OrdersDataPaginate();

	factory OrdersDataPaginate.fromJson(Map<String, dynamic> json) => $OrdersDataPaginateFromJson(json);

	Map<String, dynamic> toJson() => $OrdersDataPaginateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}