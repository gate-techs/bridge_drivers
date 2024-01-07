import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/invoice_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/invoice_entity.g.dart';

@JsonSerializable()
class InvoiceEntity {
	InvoiceData? data;

	InvoiceEntity();

	factory InvoiceEntity.fromJson(Map<String, dynamic> json) => $InvoiceEntityFromJson(json);

	Map<String, dynamic> toJson() => $InvoiceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InvoiceData {
	bool? status;
	String? path;
	String? message;

	InvoiceData();

	factory InvoiceData.fromJson(Map<String, dynamic> json) => $InvoiceDataFromJson(json);

	Map<String, dynamic> toJson() => $InvoiceDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}