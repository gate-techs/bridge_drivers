class ShipmentDetailsResponse {
  int? success;
  List<ShipmentDetailsData>? data;

  ShipmentDetailsResponse({this.success, this.data});

  ShipmentDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ShipmentDetailsData>[];
      json['data'].forEach((v) {
        data!.add(ShipmentDetailsData.fromJson(v));
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

class ShipmentDetailsData {
  String? lineId;
  String? productNo;
  String? shipmentId;
  String? price;
  String? description;
  String? weightId;
  dynamic dimId;
  String? packing;

  ShipmentDetailsData(
      {this.lineId,
      this.productNo,
      this.shipmentId,
      this.price,
      this.description,
      this.weightId,
      this.dimId,
      this.packing});

  ShipmentDetailsData.fromJson(Map<String, dynamic> json) {
    lineId = json['line_id'];
    productNo = json['product_no'];
    shipmentId = json['shipment_id'];
    price = json['price'];
    description = json['description'];
    weightId = json['weight_id'];
    dimId = json['dim_id'];
    packing = json['packing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['line_id'] = lineId;
    data['product_no'] = productNo;
    data['shipment_id'] = shipmentId;
    data['price'] = price;
    data['description'] = description;
    data['weight_id'] = weightId;
    data['dim_id'] = dimId;
    data['packing'] = packing;
    return data;
  }
}
