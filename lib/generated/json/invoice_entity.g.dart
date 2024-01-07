import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/invoice_screen/data/invoice_entity.dart';

InvoiceEntity $InvoiceEntityFromJson(Map<String, dynamic> json) {
  final InvoiceEntity invoiceEntity = InvoiceEntity();
  final InvoiceData? data = jsonConvert.convert<InvoiceData>(json['data']);
  if (data != null) {
    invoiceEntity.data = data;
  }
  return invoiceEntity;
}

Map<String, dynamic> $InvoiceEntityToJson(InvoiceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension InvoiceEntityExtension on InvoiceEntity {
  InvoiceEntity copyWith({
    InvoiceData? data,
  }) {
    return InvoiceEntity()
      ..data = data ?? this.data;
  }
}

InvoiceData $InvoiceDataFromJson(Map<String, dynamic> json) {
  final InvoiceData invoiceData = InvoiceData();
  final bool? status = jsonConvert.convert<bool>(json['status']);
  if (status != null) {
    invoiceData.status = status;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    invoiceData.path = path;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    invoiceData.message = message;
  }
  return invoiceData;
}

Map<String, dynamic> $InvoiceDataToJson(InvoiceData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['path'] = entity.path;
  data['message'] = entity.message;
  return data;
}

extension InvoiceDataExtension on InvoiceData {
  InvoiceData copyWith({
    bool? status,
    String? path,
    String? message,
  }) {
    return InvoiceData()
      ..status = status ?? this.status
      ..path = path ?? this.path
      ..message = message ?? this.message;
  }
}