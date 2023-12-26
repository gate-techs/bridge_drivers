class PreviousShipmentResponse {
  int? success;
  List<PreviousShipmentData>? data;

  PreviousShipmentResponse({this.success, this.data});

  PreviousShipmentResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <PreviousShipmentData>[];
      json['data'].forEach((v) {
        data!.add(PreviousShipmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreviousShipmentData {
  String? id;
  String? code;
  String? customerId;
  String? invoiceId;
  String? deliveryInvoiceId;
  String? organizationId;
  String? branchId;
  String? customerFromName;
  String? customerToName;
  String? createdDate;
  String? price;
  String? deliveryCost;
  String? insuranceCost;
  String? fromCountryId;
  String? fromStateId;
  String? fromCityId;
  String? fromAreaId;
  String? fromAddress;
  String? fromLa;
  String? fromLng;
  String? toCountryId;
  String? toStateId;
  String? toCityId;
  String? toAreaId;
  String? toAddress;
  String? status;
  String? flag;
  String? customerFromMob;
  String? customerToMob;
  String? customerAddressFrom;
  String? customerAddressTo;
  String? storeId;

  PreviousShipmentData(
      {this.id,
        this.code,
        this.customerId,
        this.invoiceId,
        this.deliveryInvoiceId,
        this.organizationId,
        this.branchId,
        this.customerFromName,
        this.customerToName,
        this.createdDate,
        this.price,
        this.deliveryCost,
        this.insuranceCost,
        this.fromCountryId,
        this.fromStateId,
        this.fromCityId,
        this.fromAreaId,
        this.fromAddress,
        this.fromLa,
        this.fromLng,
        this.toCountryId,
        this.toStateId,
        this.toCityId,
        this.toAreaId,
        this.toAddress,
        this.status,
        this.flag,
        this.customerFromMob,
        this.customerToMob,
        this.customerAddressFrom,
        this.customerAddressTo,
        this.storeId});

  PreviousShipmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    customerId = json['customer_id'];
    invoiceId = json['invoice_id'];
    deliveryInvoiceId = json['delivery_invoice_id'];
    organizationId = json['organization_id'];
    branchId = json['branch_id'];
    customerFromName = json['customer_from_name'];
    customerToName = json['customer_to_name'];
    createdDate = json['created_date'];
    price = json['price'];
    deliveryCost = json['delivery_cost'];
    insuranceCost = json['insurance_cost'];
    fromCountryId = json['from_country_id'];
    fromStateId = json['from_state_id'];
    fromCityId = json['from_city_id'];
    fromAreaId = json['from_area_id'];
    fromAddress = json['from_address'];
    fromLa = json['from_la'];
    fromLng = json['from_lng'];
    toCountryId = json['to_country_id'];
    toStateId = json['to_state_id'];
    toCityId = json['to_city_id'];
    toAreaId = json['to_area_id'];
    toAddress = json['to_address'];
    status = json['status'];
    flag = json['flag'];
    customerFromMob = json['customer_from_mob'];
    customerToMob = json['customer_to_mob'];
    customerAddressFrom = json['customer_address_from'];
    customerAddressTo = json['customer_address_to'];
    storeId = json['store_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['customer_id'] = customerId;
    data['invoice_id'] = invoiceId;
    data['delivery_invoice_id'] = deliveryInvoiceId;
    data['organization_id'] = organizationId;
    data['branch_id'] = branchId;
    data['customer_from_name'] = customerFromName;
    data['customer_to_name'] = customerToName;
    data['created_date'] = createdDate;
    data['price'] = price;
    data['delivery_cost'] = deliveryCost;
    data['insurance_cost'] = insuranceCost;
    data['from_country_id'] = fromCountryId;
    data['from_state_id'] = fromStateId;
    data['from_city_id'] = fromCityId;
    data['from_area_id'] = fromAreaId;
    data['from_address'] = fromAddress;
    data['from_la'] = fromLa;
    data['from_lng'] = fromLng;
    data['to_country_id'] = toCountryId;
    data['to_state_id'] = toStateId;
    data['to_city_id'] = toCityId;
    data['to_area_id'] = toAreaId;
    data['to_address'] = toAddress;
    data['status'] = status;
    data['flag'] = flag;
    data['customer_from_mob'] = customerFromMob;
    data['customer_to_mob'] = customerToMob;
    data['customer_address_from'] = customerAddressFrom;
    data['customer_address_to'] = customerAddressTo;
    data['store_id'] = storeId;
    return data;
  }
}
