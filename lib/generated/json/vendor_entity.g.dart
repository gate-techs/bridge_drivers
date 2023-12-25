import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/splash/data/vendor_entity.dart';

VendorEntity $VendorEntityFromJson(Map<String, dynamic> json) {
  final VendorEntity vendorEntity = VendorEntity();
  final VendorData? data = jsonConvert.convert<VendorData>(json['data']);
  if (data != null) {
    vendorEntity.data = data;
  }
  return vendorEntity;
}

Map<String, dynamic> $VendorEntityToJson(VendorEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension VendorEntityExtension on VendorEntity {
  VendorEntity copyWith({
    VendorData? data,
  }) {
    return VendorEntity()
      ..data = data ?? this.data;
  }
}

VendorData $VendorDataFromJson(Map<String, dynamic> json) {
  final VendorData vendorData = VendorData();
  final String? appName = jsonConvert.convert<String>(json['appName']);
  if (appName != null) {
    vendorData.appName = appName;
  }
  final String? androidPackageName = jsonConvert.convert<String>(
      json['androidPackageName']);
  if (androidPackageName != null) {
    vendorData.androidPackageName = androidPackageName;
  }
  final String? iosBundle = jsonConvert.convert<String>(json['iosBundle']);
  if (iosBundle != null) {
    vendorData.iosBundle = iosBundle;
  }
  final String? appLogo = jsonConvert.convert<String>(json['appLogo']);
  if (appLogo != null) {
    vendorData.appLogo = appLogo;
  }
  final String? homeAppLogo = jsonConvert.convert<String>(json['homeAppLogo']);
  if (homeAppLogo != null) {
    vendorData.homeAppLogo = homeAppLogo;
  }
  final String? appCurrency = jsonConvert.convert<String>(json['appCurrency']);
  if (appCurrency != null) {
    vendorData.appCurrency = appCurrency;
  }
  final String? primaryColor = jsonConvert.convert<String>(
      json['primaryColor']);
  if (primaryColor != null) {
    vendorData.primaryColor = primaryColor;
  }
  final String? colorPrimaryLight = jsonConvert.convert<String>(
      json['colorPrimaryLight']);
  if (colorPrimaryLight != null) {
    vendorData.colorPrimaryLight = colorPrimaryLight;
  }
  final String? colorPrimaryDark = jsonConvert.convert<String>(
      json['colorPrimaryDark']);
  if (colorPrimaryDark != null) {
    vendorData.colorPrimaryDark = colorPrimaryDark;
  }
  final String? colorSecondary = jsonConvert.convert<String>(
      json['colorSecondary']);
  if (colorSecondary != null) {
    vendorData.colorSecondary = colorSecondary;
  }
  final String? colorSecondaryLight = jsonConvert.convert<String>(
      json['colorSecondaryLight']);
  if (colorSecondaryLight != null) {
    vendorData.colorSecondaryLight = colorSecondaryLight;
  }
  final String? colorSecondaryDark = jsonConvert.convert<String>(
      json['colorSecondaryDark']);
  if (colorSecondaryDark != null) {
    vendorData.colorSecondaryDark = colorSecondaryDark;
  }
  final String? videoHomePromo = jsonConvert.convert<String>(
      json['videoHomePromo']);
  if (videoHomePromo != null) {
    vendorData.videoHomePromo = videoHomePromo;
  }
  final List<
      VendorDataPaymentMethods>? paymentMethods = (json['paymentMethods'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<VendorDataPaymentMethods>(
          e) as VendorDataPaymentMethods).toList();
  if (paymentMethods != null) {
    vendorData.paymentMethods = paymentMethods;
  }
  final List<VendorDataOnBoarding>? onBoarding = (json['onBoarding'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<VendorDataOnBoarding>(e) as VendorDataOnBoarding)
      .toList();
  if (onBoarding != null) {
    vendorData.onBoarding = onBoarding;
  }
  final List<dynamic>? splashScreen = (json['splashScreen'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (splashScreen != null) {
    vendorData.splashScreen = splashScreen;
  }
  final List<VendorDataSocialMedia>? socialMedia = (json['socialMedia'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<VendorDataSocialMedia>(e) as VendorDataSocialMedia)
      .toList();
  if (socialMedia != null) {
    vendorData.socialMedia = socialMedia;
  }
  final VendorDataAppStyle? appStyle = jsonConvert.convert<VendorDataAppStyle>(
      json['appStyle']);
  if (appStyle != null) {
    vendorData.appStyle = appStyle;
  }
  return vendorData;
}

Map<String, dynamic> $VendorDataToJson(VendorData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['appName'] = entity.appName;
  data['androidPackageName'] = entity.androidPackageName;
  data['iosBundle'] = entity.iosBundle;
  data['appLogo'] = entity.appLogo;
  data['homeAppLogo'] = entity.homeAppLogo;
  data['appCurrency'] = entity.appCurrency;
  data['primaryColor'] = entity.primaryColor;
  data['colorPrimaryLight'] = entity.colorPrimaryLight;
  data['colorPrimaryDark'] = entity.colorPrimaryDark;
  data['colorSecondary'] = entity.colorSecondary;
  data['colorSecondaryLight'] = entity.colorSecondaryLight;
  data['colorSecondaryDark'] = entity.colorSecondaryDark;
  data['videoHomePromo'] = entity.videoHomePromo;
  data['paymentMethods'] =
      entity.paymentMethods?.map((v) => v.toJson()).toList();
  data['onBoarding'] = entity.onBoarding?.map((v) => v.toJson()).toList();
  data['splashScreen'] = entity.splashScreen;
  data['socialMedia'] = entity.socialMedia?.map((v) => v.toJson()).toList();
  data['appStyle'] = entity.appStyle?.toJson();
  return data;
}

extension VendorDataExtension on VendorData {
  VendorData copyWith({
    String? appName,
    String? androidPackageName,
    String? iosBundle,
    String? appLogo,
    String? homeAppLogo,
    String? appCurrency,
    String? primaryColor,
    String? colorPrimaryLight,
    String? colorPrimaryDark,
    String? colorSecondary,
    String? colorSecondaryLight,
    String? colorSecondaryDark,
    String? videoHomePromo,
    List<VendorDataPaymentMethods>? paymentMethods,
    List<VendorDataOnBoarding>? onBoarding,
    List<dynamic>? splashScreen,
    List<VendorDataSocialMedia>? socialMedia,
    VendorDataAppStyle? appStyle,
  }) {
    return VendorData()
      ..appName = appName ?? this.appName
      ..androidPackageName = androidPackageName ?? this.androidPackageName
      ..iosBundle = iosBundle ?? this.iosBundle
      ..appLogo = appLogo ?? this.appLogo
      ..homeAppLogo = homeAppLogo ?? this.homeAppLogo
      ..appCurrency = appCurrency ?? this.appCurrency
      ..primaryColor = primaryColor ?? this.primaryColor
      ..colorPrimaryLight = colorPrimaryLight ?? this.colorPrimaryLight
      ..colorPrimaryDark = colorPrimaryDark ?? this.colorPrimaryDark
      ..colorSecondary = colorSecondary ?? this.colorSecondary
      ..colorSecondaryLight = colorSecondaryLight ?? this.colorSecondaryLight
      ..colorSecondaryDark = colorSecondaryDark ?? this.colorSecondaryDark
      ..videoHomePromo = videoHomePromo ?? this.videoHomePromo
      ..paymentMethods = paymentMethods ?? this.paymentMethods
      ..onBoarding = onBoarding ?? this.onBoarding
      ..splashScreen = splashScreen ?? this.splashScreen
      ..socialMedia = socialMedia ?? this.socialMedia
      ..appStyle = appStyle ?? this.appStyle;
  }
}

VendorDataPaymentMethods $VendorDataPaymentMethodsFromJson(
    Map<String, dynamic> json) {
  final VendorDataPaymentMethods vendorDataPaymentMethods = VendorDataPaymentMethods();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    vendorDataPaymentMethods.id = id;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    vendorDataPaymentMethods.image = image;
  }
  final VendorDataPaymentMethodsMedia? media = jsonConvert.convert<
      VendorDataPaymentMethodsMedia>(json['media']);
  if (media != null) {
    vendorDataPaymentMethods.media = media;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    vendorDataPaymentMethods.title = title;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    vendorDataPaymentMethods.value = value;
  }
  return vendorDataPaymentMethods;
}

Map<String, dynamic> $VendorDataPaymentMethodsToJson(
    VendorDataPaymentMethods entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['image'] = entity.image;
  data['media'] = entity.media?.toJson();
  data['title'] = entity.title;
  data['value'] = entity.value;
  return data;
}

extension VendorDataPaymentMethodsExtension on VendorDataPaymentMethods {
  VendorDataPaymentMethods copyWith({
    int? id,
    String? image,
    VendorDataPaymentMethodsMedia? media,
    String? title,
    String? value,
  }) {
    return VendorDataPaymentMethods()
      ..id = id ?? this.id
      ..image = image ?? this.image
      ..media = media ?? this.media
      ..title = title ?? this.title
      ..value = value ?? this.value;
  }
}

VendorDataPaymentMethodsMedia $VendorDataPaymentMethodsMediaFromJson(
    Map<String, dynamic> json) {
  final VendorDataPaymentMethodsMedia vendorDataPaymentMethodsMedia = VendorDataPaymentMethodsMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    vendorDataPaymentMethodsMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    vendorDataPaymentMethodsMedia.url = url;
  }
  return vendorDataPaymentMethodsMedia;
}

Map<String, dynamic> $VendorDataPaymentMethodsMediaToJson(
    VendorDataPaymentMethodsMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension VendorDataPaymentMethodsMediaExtension on VendorDataPaymentMethodsMedia {
  VendorDataPaymentMethodsMedia copyWith({
    String? type,
    String? url,
  }) {
    return VendorDataPaymentMethodsMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

VendorDataOnBoarding $VendorDataOnBoardingFromJson(Map<String, dynamic> json) {
  final VendorDataOnBoarding vendorDataOnBoarding = VendorDataOnBoarding();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    vendorDataOnBoarding.id = id;
  }
  final VendorDataOnBoardingMedia? media = jsonConvert.convert<
      VendorDataOnBoardingMedia>(json['media']);
  if (media != null) {
    vendorDataOnBoarding.media = media;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    vendorDataOnBoarding.title = title;
  }
  final dynamic body = json['body'];
  if (body != null) {
    vendorDataOnBoarding.body = body;
  }
  final dynamic module = json['module'];
  if (module != null) {
    vendorDataOnBoarding.module = module;
  }
  final dynamic moduleId = json['moduleId'];
  if (moduleId != null) {
    vendorDataOnBoarding.moduleId = moduleId;
  }
  return vendorDataOnBoarding;
}

Map<String, dynamic> $VendorDataOnBoardingToJson(VendorDataOnBoarding entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['media'] = entity.media?.toJson();
  data['title'] = entity.title;
  data['body'] = entity.body;
  data['module'] = entity.module;
  data['moduleId'] = entity.moduleId;
  return data;
}

extension VendorDataOnBoardingExtension on VendorDataOnBoarding {
  VendorDataOnBoarding copyWith({
    int? id,
    VendorDataOnBoardingMedia? media,
    String? title,
    dynamic body,
    dynamic module,
    dynamic moduleId,
  }) {
    return VendorDataOnBoarding()
      ..id = id ?? this.id
      ..media = media ?? this.media
      ..title = title ?? this.title
      ..body = body ?? this.body
      ..module = module ?? this.module
      ..moduleId = moduleId ?? this.moduleId;
  }
}

VendorDataOnBoardingMedia $VendorDataOnBoardingMediaFromJson(
    Map<String, dynamic> json) {
  final VendorDataOnBoardingMedia vendorDataOnBoardingMedia = VendorDataOnBoardingMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    vendorDataOnBoardingMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    vendorDataOnBoardingMedia.url = url;
  }
  return vendorDataOnBoardingMedia;
}

Map<String, dynamic> $VendorDataOnBoardingMediaToJson(
    VendorDataOnBoardingMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension VendorDataOnBoardingMediaExtension on VendorDataOnBoardingMedia {
  VendorDataOnBoardingMedia copyWith({
    String? type,
    String? url,
  }) {
    return VendorDataOnBoardingMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

VendorDataSocialMedia $VendorDataSocialMediaFromJson(
    Map<String, dynamic> json) {
  final VendorDataSocialMedia vendorDataSocialMedia = VendorDataSocialMedia();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    vendorDataSocialMedia.id = id;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    vendorDataSocialMedia.image = image;
  }
  final VendorDataSocialMediaMedia? media = jsonConvert.convert<
      VendorDataSocialMediaMedia>(json['media']);
  if (media != null) {
    vendorDataSocialMedia.media = media;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    vendorDataSocialMedia.title = title;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    vendorDataSocialMedia.value = value;
  }
  return vendorDataSocialMedia;
}

Map<String, dynamic> $VendorDataSocialMediaToJson(
    VendorDataSocialMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['image'] = entity.image;
  data['media'] = entity.media?.toJson();
  data['title'] = entity.title;
  data['value'] = entity.value;
  return data;
}

extension VendorDataSocialMediaExtension on VendorDataSocialMedia {
  VendorDataSocialMedia copyWith({
    int? id,
    String? image,
    VendorDataSocialMediaMedia? media,
    String? title,
    String? value,
  }) {
    return VendorDataSocialMedia()
      ..id = id ?? this.id
      ..image = image ?? this.image
      ..media = media ?? this.media
      ..title = title ?? this.title
      ..value = value ?? this.value;
  }
}

VendorDataSocialMediaMedia $VendorDataSocialMediaMediaFromJson(
    Map<String, dynamic> json) {
  final VendorDataSocialMediaMedia vendorDataSocialMediaMedia = VendorDataSocialMediaMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    vendorDataSocialMediaMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    vendorDataSocialMediaMedia.url = url;
  }
  return vendorDataSocialMediaMedia;
}

Map<String, dynamic> $VendorDataSocialMediaMediaToJson(
    VendorDataSocialMediaMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension VendorDataSocialMediaMediaExtension on VendorDataSocialMediaMedia {
  VendorDataSocialMediaMedia copyWith({
    String? type,
    String? url,
  }) {
    return VendorDataSocialMediaMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

VendorDataAppStyle $VendorDataAppStyleFromJson(Map<String, dynamic> json) {
  final VendorDataAppStyle vendorDataAppStyle = VendorDataAppStyle();
  final VendorDataAppStyleHomeStyle? homeStyle = jsonConvert.convert<
      VendorDataAppStyleHomeStyle>(json['homeStyle']);
  if (homeStyle != null) {
    vendorDataAppStyle.homeStyle = homeStyle;
  }
  final List<
      VendorDataAppStyleHomeStructureStyle>? homeStructureStyle = (json['homeStructureStyle'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<VendorDataAppStyleHomeStructureStyle>(
          e) as VendorDataAppStyleHomeStructureStyle).toList();
  if (homeStructureStyle != null) {
    vendorDataAppStyle.homeStructureStyle = homeStructureStyle;
  }
  final VendorDataAppStyleProductDetailsStyle? productDetailsStyle = jsonConvert
      .convert<VendorDataAppStyleProductDetailsStyle>(
      json['productDetailsStyle']);
  if (productDetailsStyle != null) {
    vendorDataAppStyle.productDetailsStyle = productDetailsStyle;
  }
  final VendorDataAppStyleCartStyle? cartStyle = jsonConvert.convert<
      VendorDataAppStyleCartStyle>(json['cartStyle']);
  if (cartStyle != null) {
    vendorDataAppStyle.cartStyle = cartStyle;
  }
  final VendorDataAppStyleCategoriesStyle? categoriesStyle = jsonConvert
      .convert<VendorDataAppStyleCategoriesStyle>(json['categoriesStyle']);
  if (categoriesStyle != null) {
    vendorDataAppStyle.categoriesStyle = categoriesStyle;
  }
  final VendorDataAppStyleBrandsStyle? brandsStyle = jsonConvert.convert<
      VendorDataAppStyleBrandsStyle>(json['brandsStyle']);
  if (brandsStyle != null) {
    vendorDataAppStyle.brandsStyle = brandsStyle;
  }
  final VendorDataAppStyleOffersStyle? offersStyle = jsonConvert.convert<
      VendorDataAppStyleOffersStyle>(json['offersStyle']);
  if (offersStyle != null) {
    vendorDataAppStyle.offersStyle = offersStyle;
  }
  return vendorDataAppStyle;
}

Map<String, dynamic> $VendorDataAppStyleToJson(VendorDataAppStyle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['homeStyle'] = entity.homeStyle?.toJson();
  data['homeStructureStyle'] =
      entity.homeStructureStyle?.map((v) => v.toJson()).toList();
  data['productDetailsStyle'] = entity.productDetailsStyle?.toJson();
  data['cartStyle'] = entity.cartStyle?.toJson();
  data['categoriesStyle'] = entity.categoriesStyle?.toJson();
  data['brandsStyle'] = entity.brandsStyle?.toJson();
  data['offersStyle'] = entity.offersStyle?.toJson();
  return data;
}

extension VendorDataAppStyleExtension on VendorDataAppStyle {
  VendorDataAppStyle copyWith({
    VendorDataAppStyleHomeStyle? homeStyle,
    List<VendorDataAppStyleHomeStructureStyle>? homeStructureStyle,
    VendorDataAppStyleProductDetailsStyle? productDetailsStyle,
    VendorDataAppStyleCartStyle? cartStyle,
    VendorDataAppStyleCategoriesStyle? categoriesStyle,
    VendorDataAppStyleBrandsStyle? brandsStyle,
    VendorDataAppStyleOffersStyle? offersStyle,
  }) {
    return VendorDataAppStyle()
      ..homeStyle = homeStyle ?? this.homeStyle
      ..homeStructureStyle = homeStructureStyle ?? this.homeStructureStyle
      ..productDetailsStyle = productDetailsStyle ?? this.productDetailsStyle
      ..cartStyle = cartStyle ?? this.cartStyle
      ..categoriesStyle = categoriesStyle ?? this.categoriesStyle
      ..brandsStyle = brandsStyle ?? this.brandsStyle
      ..offersStyle = offersStyle ?? this.offersStyle;
  }
}

VendorDataAppStyleHomeStyle $VendorDataAppStyleHomeStyleFromJson(
    Map<String, dynamic> json) {
  final VendorDataAppStyleHomeStyle vendorDataAppStyleHomeStyle = VendorDataAppStyleHomeStyle();
  final String? homeStyle = jsonConvert.convert<String>(json['homeStyle']);
  if (homeStyle != null) {
    vendorDataAppStyleHomeStyle.homeStyle = homeStyle;
  }
  final List<String>? homeStructure = (json['homeStructure'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (homeStructure != null) {
    vendorDataAppStyleHomeStyle.homeStructure = homeStructure;
  }
  return vendorDataAppStyleHomeStyle;
}

Map<String, dynamic> $VendorDataAppStyleHomeStyleToJson(
    VendorDataAppStyleHomeStyle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['homeStyle'] = entity.homeStyle;
  data['homeStructure'] = entity.homeStructure;
  return data;
}

extension VendorDataAppStyleHomeStyleExtension on VendorDataAppStyleHomeStyle {
  VendorDataAppStyleHomeStyle copyWith({
    String? homeStyle,
    List<String>? homeStructure,
  }) {
    return VendorDataAppStyleHomeStyle()
      ..homeStyle = homeStyle ?? this.homeStyle
      ..homeStructure = homeStructure ?? this.homeStructure;
  }
}

VendorDataAppStyleHomeStructureStyle $VendorDataAppStyleHomeStructureStyleFromJson(
    Map<String, dynamic> json) {
  final VendorDataAppStyleHomeStructureStyle vendorDataAppStyleHomeStructureStyle = VendorDataAppStyleHomeStructureStyle();
  final String? style = jsonConvert.convert<String>(json['style']);
  if (style != null) {
    vendorDataAppStyleHomeStructureStyle.style = style;
  }
  final String? productItemStyle = jsonConvert.convert<String>(
      json['productItemStyle']);
  if (productItemStyle != null) {
    vendorDataAppStyleHomeStructureStyle.productItemStyle = productItemStyle;
  }
  return vendorDataAppStyleHomeStructureStyle;
}

Map<String, dynamic> $VendorDataAppStyleHomeStructureStyleToJson(
    VendorDataAppStyleHomeStructureStyle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['style'] = entity.style;
  data['productItemStyle'] = entity.productItemStyle;
  return data;
}

extension VendorDataAppStyleHomeStructureStyleExtension on VendorDataAppStyleHomeStructureStyle {
  VendorDataAppStyleHomeStructureStyle copyWith({
    String? style,
    String? productItemStyle,
  }) {
    return VendorDataAppStyleHomeStructureStyle()
      ..style = style ?? this.style
      ..productItemStyle = productItemStyle ?? this.productItemStyle;
  }
}

VendorDataAppStyleProductDetailsStyle $VendorDataAppStyleProductDetailsStyleFromJson(
    Map<String, dynamic> json) {
  final VendorDataAppStyleProductDetailsStyle vendorDataAppStyleProductDetailsStyle = VendorDataAppStyleProductDetailsStyle();
  final String? style = jsonConvert.convert<String>(json['style']);
  if (style != null) {
    vendorDataAppStyleProductDetailsStyle.style = style;
  }
  final String? relatedProductItemStyle = jsonConvert.convert<String>(
      json['relatedProductItemStyle']);
  if (relatedProductItemStyle != null) {
    vendorDataAppStyleProductDetailsStyle.relatedProductItemStyle =
        relatedProductItemStyle;
  }
  return vendorDataAppStyleProductDetailsStyle;
}

Map<String, dynamic> $VendorDataAppStyleProductDetailsStyleToJson(
    VendorDataAppStyleProductDetailsStyle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['style'] = entity.style;
  data['relatedProductItemStyle'] = entity.relatedProductItemStyle;
  return data;
}

extension VendorDataAppStyleProductDetailsStyleExtension on VendorDataAppStyleProductDetailsStyle {
  VendorDataAppStyleProductDetailsStyle copyWith({
    String? style,
    String? relatedProductItemStyle,
  }) {
    return VendorDataAppStyleProductDetailsStyle()
      ..style = style ?? this.style
      ..relatedProductItemStyle = relatedProductItemStyle ??
          this.relatedProductItemStyle;
  }
}

VendorDataAppStyleCartStyle $VendorDataAppStyleCartStyleFromJson(
    Map<String, dynamic> json) {
  final VendorDataAppStyleCartStyle vendorDataAppStyleCartStyle = VendorDataAppStyleCartStyle();
  final String? style = jsonConvert.convert<String>(json['style']);
  if (style != null) {
    vendorDataAppStyleCartStyle.style = style;
  }
  final String? productItemStyle = jsonConvert.convert<String>(
      json['productItemStyle']);
  if (productItemStyle != null) {
    vendorDataAppStyleCartStyle.productItemStyle = productItemStyle;
  }
  return vendorDataAppStyleCartStyle;
}

Map<String, dynamic> $VendorDataAppStyleCartStyleToJson(
    VendorDataAppStyleCartStyle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['style'] = entity.style;
  data['productItemStyle'] = entity.productItemStyle;
  return data;
}

extension VendorDataAppStyleCartStyleExtension on VendorDataAppStyleCartStyle {
  VendorDataAppStyleCartStyle copyWith({
    String? style,
    String? productItemStyle,
  }) {
    return VendorDataAppStyleCartStyle()
      ..style = style ?? this.style
      ..productItemStyle = productItemStyle ?? this.productItemStyle;
  }
}

VendorDataAppStyleCategoriesStyle $VendorDataAppStyleCategoriesStyleFromJson(
    Map<String, dynamic> json) {
  final VendorDataAppStyleCategoriesStyle vendorDataAppStyleCategoriesStyle = VendorDataAppStyleCategoriesStyle();
  final String? style = jsonConvert.convert<String>(json['style']);
  if (style != null) {
    vendorDataAppStyleCategoriesStyle.style = style;
  }
  final String? categoryItemStyle = jsonConvert.convert<String>(
      json['categoryItemStyle']);
  if (categoryItemStyle != null) {
    vendorDataAppStyleCategoriesStyle.categoryItemStyle = categoryItemStyle;
  }
  return vendorDataAppStyleCategoriesStyle;
}

Map<String, dynamic> $VendorDataAppStyleCategoriesStyleToJson(
    VendorDataAppStyleCategoriesStyle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['style'] = entity.style;
  data['categoryItemStyle'] = entity.categoryItemStyle;
  return data;
}

extension VendorDataAppStyleCategoriesStyleExtension on VendorDataAppStyleCategoriesStyle {
  VendorDataAppStyleCategoriesStyle copyWith({
    String? style,
    String? categoryItemStyle,
  }) {
    return VendorDataAppStyleCategoriesStyle()
      ..style = style ?? this.style
      ..categoryItemStyle = categoryItemStyle ?? this.categoryItemStyle;
  }
}

VendorDataAppStyleBrandsStyle $VendorDataAppStyleBrandsStyleFromJson(
    Map<String, dynamic> json) {
  final VendorDataAppStyleBrandsStyle vendorDataAppStyleBrandsStyle = VendorDataAppStyleBrandsStyle();
  final String? style = jsonConvert.convert<String>(json['style']);
  if (style != null) {
    vendorDataAppStyleBrandsStyle.style = style;
  }
  final String? brandItemStyle = jsonConvert.convert<String>(
      json['brandItemStyle']);
  if (brandItemStyle != null) {
    vendorDataAppStyleBrandsStyle.brandItemStyle = brandItemStyle;
  }
  return vendorDataAppStyleBrandsStyle;
}

Map<String, dynamic> $VendorDataAppStyleBrandsStyleToJson(
    VendorDataAppStyleBrandsStyle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['style'] = entity.style;
  data['brandItemStyle'] = entity.brandItemStyle;
  return data;
}

extension VendorDataAppStyleBrandsStyleExtension on VendorDataAppStyleBrandsStyle {
  VendorDataAppStyleBrandsStyle copyWith({
    String? style,
    String? brandItemStyle,
  }) {
    return VendorDataAppStyleBrandsStyle()
      ..style = style ?? this.style
      ..brandItemStyle = brandItemStyle ?? this.brandItemStyle;
  }
}

VendorDataAppStyleOffersStyle $VendorDataAppStyleOffersStyleFromJson(
    Map<String, dynamic> json) {
  final VendorDataAppStyleOffersStyle vendorDataAppStyleOffersStyle = VendorDataAppStyleOffersStyle();
  final String? style = jsonConvert.convert<String>(json['style']);
  if (style != null) {
    vendorDataAppStyleOffersStyle.style = style;
  }
  final String? offerItemStyle = jsonConvert.convert<String>(
      json['offerItemStyle']);
  if (offerItemStyle != null) {
    vendorDataAppStyleOffersStyle.offerItemStyle = offerItemStyle;
  }
  return vendorDataAppStyleOffersStyle;
}

Map<String, dynamic> $VendorDataAppStyleOffersStyleToJson(
    VendorDataAppStyleOffersStyle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['style'] = entity.style;
  data['offerItemStyle'] = entity.offerItemStyle;
  return data;
}

extension VendorDataAppStyleOffersStyleExtension on VendorDataAppStyleOffersStyle {
  VendorDataAppStyleOffersStyle copyWith({
    String? style,
    String? offerItemStyle,
  }) {
    return VendorDataAppStyleOffersStyle()
      ..style = style ?? this.style
      ..offerItemStyle = offerItemStyle ?? this.offerItemStyle;
  }
}