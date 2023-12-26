class WarehousesResponse {
  int? status;
  List<WarehousesData>? data;
  String? message;

  WarehousesResponse({this.status, this.data, this.message});

  WarehousesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <WarehousesData>[];
      json['data'].forEach((v) {
        data!.add(WarehousesData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class WarehousesData {
  int? id;
  String? code;
  String? name;
  String? lat;
  String? lng;
  String? phone;

  WarehousesData(
      {this.id, this.code, this.name, this.lat, this.lng, this.phone});

  WarehousesData.fromJson(Map<String, dynamic> json) {
    id = json['STORE_ID'];
    code = json['STORE_CODE'];
    name = json['STORE_NAME'];
    lat = json['COORD_Y'];
    lng = json['COORD_X'];
    phone = json['TEL_NO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STORE_ID'] = id;
    data['STORE_CODE'] = code;
    data['STORE_NAME'] = name;
    data['COORD_Y'] = lat;
    data['COORD_X'] = lng;
    data['TEL_NO'] = phone;
    return data;
  }
}
