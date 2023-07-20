import 'package:kishk_driver/generated/json/base/json_convert_content.dart';

import '../../features/auth/profile/data/logoutt_entity.dart';


LogouttEntity $LogouttEntityFromJson(Map<String, dynamic> json) {
	final LogouttEntity logouttEntity = LogouttEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		logouttEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		logouttEntity.message = message;
	}
	return logouttEntity;
}

Map<String, dynamic> $LogouttEntityToJson(LogouttEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['message'] = entity.message;
	return data;
}