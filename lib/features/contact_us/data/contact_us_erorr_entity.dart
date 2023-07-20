import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/contact_us_erorr_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ContactUsErorrEntity {
	String? message;
	ContactUsErorrErrors? errors;

	ContactUsErorrEntity();

	factory ContactUsErorrEntity.fromJson(Map<String, dynamic> json) => $ContactUsErorrEntityFromJson(json);

	Map<String, dynamic> toJson() => $ContactUsErorrEntityToJson(this);

	ContactUsErorrEntity copyWith({String? message, ContactUsErorrErrors? errors}) {
		return ContactUsErorrEntity()
			..message= message ?? this.message
			..errors= errors ?? this.errors;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ContactUsErorrErrors {
	List<String>? email;

	ContactUsErorrErrors();

	factory ContactUsErorrErrors.fromJson(Map<String, dynamic> json) => $ContactUsErorrErrorsFromJson(json);

	Map<String, dynamic> toJson() => $ContactUsErorrErrorsToJson(this);

	ContactUsErorrErrors copyWith({List<String>? email}) {
		return ContactUsErorrErrors()
			..email= email ?? this.email;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}