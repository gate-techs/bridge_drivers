import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/vendor_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/vendor_entity.g.dart';

@JsonSerializable()
class VendorEntity {
	VendorData? data;

	VendorEntity();

	factory VendorEntity.fromJson(Map<String, dynamic> json) => $VendorEntityFromJson(json);

	Map<String, dynamic> toJson() => $VendorEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorData {
	String? appName;
	String? androidPackageName;
	String? iosBundle;
	String? appLogo;
	String? homeAppLogo;
	String? appCurrency;
	String? primaryColor;
	String? colorPrimaryLight;
	String? colorPrimaryDark;
	String? colorSecondary;
	String? colorSecondaryLight;
	String? colorSecondaryDark;
	String? videoHomePromo;
	List<VendorDataPaymentMethods>? paymentMethods;
	List<VendorDataOnBoarding>? onBoarding;
	List<dynamic>? splashScreen;
	List<VendorDataSocialMedia>? socialMedia;
	VendorDataAppStyle? appStyle;

	VendorData();

	factory VendorData.fromJson(Map<String, dynamic> json) => $VendorDataFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataPaymentMethods {
	int? id;
	String? image;
	VendorDataPaymentMethodsMedia? media;
	String? title;
	String? value;

	VendorDataPaymentMethods();

	factory VendorDataPaymentMethods.fromJson(Map<String, dynamic> json) => $VendorDataPaymentMethodsFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataPaymentMethodsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataPaymentMethodsMedia {
	String? type;
	String? url;

	VendorDataPaymentMethodsMedia();

	factory VendorDataPaymentMethodsMedia.fromJson(Map<String, dynamic> json) => $VendorDataPaymentMethodsMediaFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataPaymentMethodsMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataOnBoarding {
	int? id;
	VendorDataOnBoardingMedia? media;
	String? title;
	dynamic body;
	dynamic module;
	dynamic moduleId;

	VendorDataOnBoarding();

	factory VendorDataOnBoarding.fromJson(Map<String, dynamic> json) => $VendorDataOnBoardingFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataOnBoardingToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataOnBoardingMedia {
	String? type;
	String? url;

	VendorDataOnBoardingMedia();

	factory VendorDataOnBoardingMedia.fromJson(Map<String, dynamic> json) => $VendorDataOnBoardingMediaFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataOnBoardingMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataSocialMedia {
	int? id;
	String? image;
	VendorDataSocialMediaMedia? media;
	String? title;
	String? value;

	VendorDataSocialMedia();

	factory VendorDataSocialMedia.fromJson(Map<String, dynamic> json) => $VendorDataSocialMediaFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataSocialMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataSocialMediaMedia {
	String? type;
	String? url;

	VendorDataSocialMediaMedia();

	factory VendorDataSocialMediaMedia.fromJson(Map<String, dynamic> json) => $VendorDataSocialMediaMediaFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataSocialMediaMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataAppStyle {
	VendorDataAppStyleHomeStyle? homeStyle;
	List<VendorDataAppStyleHomeStructureStyle>? homeStructureStyle;
	VendorDataAppStyleProductDetailsStyle? productDetailsStyle;
	VendorDataAppStyleCartStyle? cartStyle;
	VendorDataAppStyleCategoriesStyle? categoriesStyle;
	VendorDataAppStyleBrandsStyle? brandsStyle;
	VendorDataAppStyleOffersStyle? offersStyle;

	VendorDataAppStyle();

	factory VendorDataAppStyle.fromJson(Map<String, dynamic> json) => $VendorDataAppStyleFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataAppStyleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataAppStyleHomeStyle {
	String? homeStyle;
	List<String>? homeStructure;

	VendorDataAppStyleHomeStyle();

	factory VendorDataAppStyleHomeStyle.fromJson(Map<String, dynamic> json) => $VendorDataAppStyleHomeStyleFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataAppStyleHomeStyleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataAppStyleHomeStructureStyle {
	String? style;
	String? productItemStyle;

	VendorDataAppStyleHomeStructureStyle();

	factory VendorDataAppStyleHomeStructureStyle.fromJson(Map<String, dynamic> json) => $VendorDataAppStyleHomeStructureStyleFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataAppStyleHomeStructureStyleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataAppStyleProductDetailsStyle {
	String? style;
	String? relatedProductItemStyle;

	VendorDataAppStyleProductDetailsStyle();

	factory VendorDataAppStyleProductDetailsStyle.fromJson(Map<String, dynamic> json) => $VendorDataAppStyleProductDetailsStyleFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataAppStyleProductDetailsStyleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataAppStyleCartStyle {
	String? style;
	String? productItemStyle;

	VendorDataAppStyleCartStyle();

	factory VendorDataAppStyleCartStyle.fromJson(Map<String, dynamic> json) => $VendorDataAppStyleCartStyleFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataAppStyleCartStyleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataAppStyleCategoriesStyle {
	String? style;
	String? categoryItemStyle;

	VendorDataAppStyleCategoriesStyle();

	factory VendorDataAppStyleCategoriesStyle.fromJson(Map<String, dynamic> json) => $VendorDataAppStyleCategoriesStyleFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataAppStyleCategoriesStyleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataAppStyleBrandsStyle {
	String? style;
	String? brandItemStyle;

	VendorDataAppStyleBrandsStyle();

	factory VendorDataAppStyleBrandsStyle.fromJson(Map<String, dynamic> json) => $VendorDataAppStyleBrandsStyleFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataAppStyleBrandsStyleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VendorDataAppStyleOffersStyle {
	String? style;
	String? offerItemStyle;

	VendorDataAppStyleOffersStyle();

	factory VendorDataAppStyleOffersStyle.fromJson(Map<String, dynamic> json) => $VendorDataAppStyleOffersStyleFromJson(json);

	Map<String, dynamic> toJson() => $VendorDataAppStyleOffersStyleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}