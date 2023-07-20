class MyProfileResponse {
  MyProfileData? data;

  MyProfileResponse({this.data});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? MyProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MyProfileData {
  bool? status;
  String? message;
  Rows? rows;

  MyProfileData({this.status, this.message, this.rows});

  MyProfileData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    rows = json['rows'] != null ? Rows.fromJson(json['rows']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (rows != null) {
      data['rows'] = rows!.toJson();
    }
    return data;
  }
}

class Rows {
  int? id;
  String? avatar;
  String? name;
  String? email;
  String? mobile;

  Rows({this.id, this.avatar, this.name, this.email, this.mobile});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['avatar'] = avatar;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    return data;
  }
}
