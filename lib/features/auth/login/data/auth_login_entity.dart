class AuthDataEntity {
  AuthDataData? data;

  AuthDataEntity({this.data});

  AuthDataEntity.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'] != null ? AuthDataData.fromJson(json['data']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AuthDataData {
  UserData? userData;
  String? accessToken;
  List<UserAbilities>? userAbilities;

  AuthDataData({this.userData, this.accessToken, this.userAbilities});

  AuthDataData.fromJson(Map<dynamic, dynamic> json) {
    userData = json['userData'] != null
        ? UserData.fromJson(json['userData'])
        : null;
    accessToken = json['accessToken'];
    if (json['userAbilities'] != null) {
      userAbilities = <UserAbilities>[];
      json['userAbilities'].forEach((v) {
        userAbilities!.add(UserAbilities.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    if (userData != null) {
      data['userData'] = userData!.toJson();
    }
    data['accessToken'] = accessToken;
    if (userAbilities != null) {
      data['userAbilities'] =
          userAbilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? encryptId;
  String? vendorId;
  String? username;
  String? email;
  String? avatar;
  String? role;

  UserData(
      {this.encryptId,
        this.vendorId,
        this.username,
        this.email,
        this.avatar,
        this.role});

  UserData.fromJson(Map<dynamic, dynamic> json) {
    encryptId = json['encryptId'];
    vendorId = json['vendorId'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['encryptId'] = encryptId;
    data['vendorId'] = vendorId;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    data['role'] = role;
    return data;
  }
}

class UserAbilities {
  String? action;
  String? subject;

  UserAbilities({this.action, this.subject});

  UserAbilities.fromJson(Map<dynamic, dynamic> json) {
    action = json['action'];
    subject = json['subject'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['action'] = action;
    data['subject'] = subject;
    return data;
  }
}