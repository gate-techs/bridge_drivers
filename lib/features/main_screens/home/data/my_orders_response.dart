class MyOrdersResponse {
  MyOrdersData? data;

  MyOrdersResponse({this.data});

  MyOrdersResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? MyOrdersData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MyOrdersData {
  bool? status;
  String? message;
  List<MyOrdersDataRows>? rows;
  Pagination? pagination;

  MyOrdersData({this.status, this.message, this.rows, this.pagination});

  MyOrdersData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['rows'] != null) {
      rows = <MyOrdersDataRows>[];
      json['rows'].forEach((v) {
        rows!.add(MyOrdersDataRows.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class MyOrdersDataRows {
  int? id;
  String? invoiceNumber;
  String? totalPrice;
  String? statusId;
  String? statusName;
  String? date;
  User? user;

  MyOrdersDataRows(
      {this.id,
      this.invoiceNumber,
      this.totalPrice,
      this.statusId,
      this.statusName,
      this.date,
      this.user});

  MyOrdersDataRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNumber = json['invoice_number'];
    totalPrice = json['total_price'];
    statusId = json['status_id'];
    statusName = json['status_name'];
    date = json['date'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoice_number'] = invoiceNumber;
    data['total_price'] = totalPrice;
    data['status_id'] = statusId;
    data['status_name'] = statusName;
    data['date'] = date;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? mobile;
  String? address;

  User({this.name, this.email, this.mobile, this.address});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    return data;
  }
}

class Pagination {
  int? total;
  int? perPage;
  int? currentPage;

  Pagination({this.total, this.perPage, this.currentPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    return data;
  }
}
