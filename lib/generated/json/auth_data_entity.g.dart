import 'package:kishk_driver/generated/json/base/json_convert_content.dart';

import '../../features/auth/login/data/auth_data_entity.dart';

AuthDataEntity $AuthDataEntityFromJson(Map<dynamic, dynamic> json) {
	final AuthDataEntity authDataEntity = AuthDataEntity();
	final AuthDataData? data = jsonConvert.convert<AuthDataData>(json['data']);
	if (data != null) {
		authDataEntity.data = data;
	}
	return authDataEntity;
}

Map<String, dynamic> $AuthDataEntityToJson(AuthDataEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

AuthDataData $AuthDataDataFromJson(Map<dynamic, dynamic> json) {
	final AuthDataData authDataData = AuthDataData();
	final bool? status = jsonConvert.convert<bool>(json['status']);
	if (status != null) {
		authDataData.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		authDataData.message = message;
	}
	final String? tokenType = jsonConvert.convert<String>(json['tokenType']);
	if (tokenType != null) {
		authDataData.tokenType = tokenType;
	}
	final String? accessToken = jsonConvert.convert<String>(json['accessToken']);
	if (accessToken != null) {
		authDataData.accessToken = accessToken;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		authDataData.username = username;
	}
	final dynamic avatar = jsonConvert.convert<dynamic>(json['avatar']);
	if (avatar != null) {
		authDataData.avatar = avatar;
	}
	return authDataData;
}

Map<String, dynamic> $AuthDataDataToJson(AuthDataData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['tokenType'] = entity.tokenType;
	data['accessToken'] = entity.accessToken;
	data['username'] = entity.username;
	data['avatar'] = entity.avatar;
	return data;
}