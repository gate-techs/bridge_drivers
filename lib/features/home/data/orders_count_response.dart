class OrdersCountResponse {
  bool? status;
  String? message;
  OrdersCountData? data;

  OrdersCountResponse({this.status, this.message, this.data});

  OrdersCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? OrdersCountData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrdersCountData {
  Count? count;

  OrdersCountData({this.count});

  OrdersCountData.fromJson(Map<String, dynamic> json) {
    count = json['count'] != null ? Count.fromJson(json['count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (count != null) {
      data['count'] = count!.toJson();
    }
    return data;
  }
}

class Count {
  String? news;
  String? total;

  Count({this.news, this.total});

  Count.fromJson(Map<String, dynamic> json) {
    news = json['new'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['new'] = news;
    data['total'] = total;
    return data;
  }
}
