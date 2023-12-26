import 'previous_shipment_response.dart';

class SearchShipmentResponse {
  int? success;
  PreviousShipmentData? data;

  SearchShipmentResponse({this.success, this.data});

  SearchShipmentResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? PreviousShipmentData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
