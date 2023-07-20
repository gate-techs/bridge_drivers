class NotificationsResponse {
  NotificationsData? data;

  NotificationsResponse({this.data});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? NotificationsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NotificationsData {
  bool? status;
  String? message;
  List<NotificationsDataRows>? rows;
  Pagination? pagination;

  NotificationsData({this.status, this.message, this.rows, this.pagination});

  NotificationsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['rows'] != null) {
      rows = <NotificationsDataRows>[];
      json['rows'].forEach((v) {
        rows!.add(NotificationsDataRows.fromJson(v));
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

class NotificationsDataRows {
  int? id;
  String? msg;
  UserData? userData;
  String? dateForHumans;

  NotificationsDataRows({this.id, this.msg, this.userData, this.dateForHumans});

  NotificationsDataRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    msg = json['msg'];
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    dateForHumans = json['dateForHumans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['msg'] = msg;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    data['dateForHumans'] = dateForHumans;
    return data;
  }
}

class UserData {
  String? clientName;
  String? status;
  int? orderId;
  int? statusId;

  UserData({this.clientName, this.status, this.orderId, this.statusId});

  UserData.fromJson(Map<String, dynamic> json) {
    clientName = json['client_name'];
    status = json['status'];
    orderId = json['order_id'];
    statusId = json['status_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client_name'] = clientName;
    data['status'] = status;
    data['order_id'] = orderId;
    data['status_id'] = statusId;
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
