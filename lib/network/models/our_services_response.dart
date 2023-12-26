class OurServicesResponse {
  int? status;
  List<OurServicesData>? data;
  String? message;

  OurServicesResponse({this.status, this.data, this.message});

  OurServicesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <OurServicesData>[];
      json['data'].forEach((v) {
        data!.add(OurServicesData.fromJson(v));
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

class OurServicesData {
  int? id;
  String? title;
  String? description;
  String? img;
  String? action;

  OurServicesData({this.id, this.title, this.description, this.img});

  OurServicesData.fromJson(Map<String, dynamic> json) {
    id = json['SER_ID'];
    title = json['SER_TITAL'];
    description = json['SER_DESC'];
    img = json['SER_IMG'];
    action = json['SER_ACTION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SER_ID'] = id;
    data['SER_TITAL'] = title;
    data['SER_DESC'] = description;
    data['SER_IMG'] = img;
    data['SER_ACTION'] = action;
    return data;
  }
}
