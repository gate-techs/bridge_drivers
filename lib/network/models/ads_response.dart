class AdsResponse {
  int? status;
  List<AdsData>? data;
  String? message;

  AdsResponse({this.status, this.data, this.message});

  AdsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AdsData>[];
      json['data'].forEach((v) {
        data!.add(AdsData.fromJson(v));
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

class AdsData {
  int? adsId;
  String? adsTitle;
  String? adsDesc;
  String? adsImg;

  AdsData({this.adsId, this.adsTitle, this.adsDesc, this.adsImg});

  AdsData.fromJson(Map<String, dynamic> json) {
    adsId = json['ADS_ID'];
    adsTitle = json['ADS_TITAL'];
    adsDesc = json['ADS_DESC'];
    adsImg = json['ADS_IMG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ADS_ID'] = adsId;
    data['ADS_TITAL'] = adsTitle;
    data['ADS_DESC'] = adsDesc;
    data['ADS_IMG'] = adsImg;
    return data;
  }
}
