class VendorEntity {
  VendorData? data;

  VendorEntity({this.data});

  VendorEntity.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'] != null ? VendorData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

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
  List<PaymentMethods>? paymentMethods;
  List<OnBoarding>? onBoarding;
  List<SplashScreen>? splashScreen;
  List<PaymentMethods>? socialMedia;
  AppStyle? appStyle;

  VendorData(
      {this.appName,
        this.androidPackageName,
        this.iosBundle,
        this.appLogo,
        this.homeAppLogo,
        this.appCurrency,
        this.primaryColor,
        this.colorPrimaryLight,
        this.colorPrimaryDark,
        this.colorSecondary,
        this.colorSecondaryLight,
        this.colorSecondaryDark,
        this.videoHomePromo,
        this.paymentMethods,
        this.onBoarding,
        this.splashScreen,
        this.socialMedia,
        this.appStyle});

  VendorData.fromJson(Map<dynamic, dynamic> json) {
    appName = json['appName'];
    androidPackageName = json['androidPackageName'];
    iosBundle = json['iosBundle'];
    appLogo = json['appLogo'];
    homeAppLogo = json['homeAppLogo'];
    appCurrency = json['appCurrency'];
    primaryColor = json['primaryColor'];
    colorPrimaryLight = json['colorPrimaryLight'];
    colorPrimaryDark = json['colorPrimaryDark'];
    colorSecondary = json['colorSecondary'];
    colorSecondaryLight = json['colorSecondaryLight'];
    colorSecondaryDark = json['colorSecondaryDark'];
    videoHomePromo = json['videoHomePromo'];
    if (json['paymentMethods'] != null) {
      paymentMethods = <PaymentMethods>[];
      json['paymentMethods'].forEach((v) {
        paymentMethods!.add(PaymentMethods.fromJson(v));
      });
    }
    if (json['onBoarding'] != null) {
      onBoarding = <OnBoarding>[];
      json['onBoarding'].forEach((v) {
        onBoarding!.add(OnBoarding.fromJson(v));
      });
    }
    if (json['splashScreen'] != null) {
      splashScreen = <SplashScreen>[];
      json['splashScreen'].forEach((v) {
        splashScreen!.add(SplashScreen.fromJson(v));
      });
    }
    if (json['socialMedia'] != null) {
      socialMedia = <PaymentMethods>[];
      json['socialMedia'].forEach((v) {
        socialMedia!.add(PaymentMethods.fromJson(v));
      });
    }
    appStyle = json['appStyle'] != null
        ? AppStyle.fromJson(json['appStyle'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appName'] = appName;
    data['androidPackageName'] = androidPackageName;
    data['iosBundle'] = iosBundle;
    data['appLogo'] = appLogo;
    data['homeAppLogo'] = homeAppLogo;
    data['appCurrency'] = appCurrency;
    data['primaryColor'] = primaryColor;
    data['colorPrimaryLight'] = colorPrimaryLight;
    data['colorPrimaryDark'] = colorPrimaryDark;
    data['colorSecondary'] = colorSecondary;
    data['colorSecondaryLight'] = colorSecondaryLight;
    data['colorSecondaryDark'] = colorSecondaryDark;
    data['videoHomePromo'] = videoHomePromo;
    if (paymentMethods != null) {
      data['paymentMethods'] =
          paymentMethods!.map((v) => v.toJson()).toList();
    }
    if (onBoarding != null) {
      data['onBoarding'] = onBoarding!.map((v) => v.toJson()).toList();
    }
    if (splashScreen != null) {
      data['splashScreen'] = splashScreen!.map((v) => v.toJson()).toList();
    }
    if (socialMedia != null) {
      data['socialMedia'] = socialMedia!.map((v) => v.toJson()).toList();
    }
    if (appStyle != null) {
      data['appStyle'] = appStyle!.toJson();
    }
    return data;
  }
}

class PaymentMethods {
  int? id;
  String? image;
  Media? media;
  String? title;
  String? value;

  PaymentMethods({this.id, this.image, this.media, this.title, this.value});

  PaymentMethods.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    image = json['image'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    data['title'] = title;
    data['value'] = value;
    return data;
  }
}

class Media {
  String? type;
  String? url;

  Media({this.type, this.url});

  Media.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

class OnBoarding {
  int? id;
  Media? media;
  String? title;
  String? body;
  String? module;
  String? moduleId;

  OnBoarding(
      {this.id, this.media, this.title, this.body, this.module, this.moduleId});

  OnBoarding.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
    title = json['title'];
    body = json['body'];
    module = json['module'];
    moduleId = json['moduleId'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    data['title'] = title;
    data['body'] = body;
    data['module'] = module;
    data['moduleId'] = moduleId;
    return data;
  }
}

class SplashScreen {
  int? id;
  Media? media;
  String? title;
  String? body;
  String? module;
  String? moduleId;

  SplashScreen(
      {this.id, this.media, this.title, this.body, this.module, this.moduleId});

  SplashScreen.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
    title = json['title'];
    body = json['body'];
    module = json['module'];
    moduleId = json['moduleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    data['title'] = title;
    data['body'] = body;
    data['module'] = module;
    data['moduleId'] = moduleId;
    return data;
  }
}

class AppStyle {
  HomeStyle? homeStyle;
  List<HomeStructureStyle>? homeStructureStyle;
  ProductDetailsStyle? productDetailsStyle;
  HomeStructureStyle? cartStyle;
  CategoriesStyle? categoriesStyle;
  BrandsStyle? brandsStyle;
  OffersStyle? offersStyle;

  AppStyle(
      {this.homeStyle,
        this.homeStructureStyle,
        this.productDetailsStyle,
        this.cartStyle,
        this.categoriesStyle,
        this.brandsStyle,
        this.offersStyle});

  AppStyle.fromJson(Map<dynamic, dynamic> json) {
    homeStyle = json['homeStyle'] != null
        ? HomeStyle.fromJson(json['homeStyle'])
        : null;
    if (json['homeStructureStyle'] != null) {
      homeStructureStyle = <HomeStructureStyle>[];
      json['homeStructureStyle'].forEach((v) {
        homeStructureStyle!.add(HomeStructureStyle.fromJson(v));
      });
    }
    productDetailsStyle = json['productDetailsStyle'] != null
        ? ProductDetailsStyle.fromJson(json['productDetailsStyle'])
        : null;
    cartStyle = json['cartStyle'] != null
        ? HomeStructureStyle.fromJson(json['cartStyle'])
        : null;
    categoriesStyle = json['categoriesStyle'] != null
        ? CategoriesStyle.fromJson(json['categoriesStyle'])
        : null;
    brandsStyle = json['brandsStyle'] != null
        ? BrandsStyle.fromJson(json['brandsStyle'])
        : null;
    offersStyle = json['offersStyle'] != null
        ? OffersStyle.fromJson(json['offersStyle'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homeStyle != null) {
      data['homeStyle'] = homeStyle!.toJson();
    }
    if (homeStructureStyle != null) {
      data['homeStructureStyle'] =
          homeStructureStyle!.map((v) => v.toJson()).toList();
    }
    if (productDetailsStyle != null) {
      data['productDetailsStyle'] = productDetailsStyle!.toJson();
    }
    if (cartStyle != null) {
      data['cartStyle'] = cartStyle!.toJson();
    }
    if (categoriesStyle != null) {
      data['categoriesStyle'] = categoriesStyle!.toJson();
    }
    if (brandsStyle != null) {
      data['brandsStyle'] = brandsStyle!.toJson();
    }
    if (offersStyle != null) {
      data['offersStyle'] = offersStyle!.toJson();
    }
    return data;
  }
}

class HomeStyle {
  String? homeStyle;
  List<String>? homeStructure;

  HomeStyle({this.homeStyle, this.homeStructure});

  HomeStyle.fromJson(Map<dynamic, dynamic> json) {
    homeStyle = json['homeStyle'];
    homeStructure = json['homeStructure'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homeStyle'] = homeStyle;
    data['homeStructure'] = homeStructure;
    return data;
  }
}

class HomeStructureStyle {
  String? style;
  String? productItemStyle;

  HomeStructureStyle({this.style, this.productItemStyle});

  HomeStructureStyle.fromJson(Map<dynamic, dynamic> json) {
    style = json['style'];
    productItemStyle = json['productItemStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['style'] = style;
    data['productItemStyle'] = productItemStyle;
    return data;
  }
}

class ProductDetailsStyle {
  String? style;
  String? relatedProductItemStyle;

  ProductDetailsStyle({this.style, this.relatedProductItemStyle});

  ProductDetailsStyle.fromJson(Map<dynamic, dynamic> json) {
    style = json['style'];
    relatedProductItemStyle = json['relatedProductItemStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['style'] = style;
    data['relatedProductItemStyle'] = relatedProductItemStyle;
    return data;
  }
}

class CategoriesStyle {
  String? style;
  String? categoryItemStyle;

  CategoriesStyle({this.style, this.categoryItemStyle});

  CategoriesStyle.fromJson(Map<dynamic, dynamic> json) {
    style = json['style'];
    categoryItemStyle = json['categoryItemStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['style'] = style;
    data['categoryItemStyle'] = categoryItemStyle;
    return data;
  }
}

class BrandsStyle {
  String? style;
  String? brandItemStyle;

  BrandsStyle({this.style, this.brandItemStyle});

  BrandsStyle.fromJson(Map<dynamic, dynamic> json) {
    style = json['style'];
    brandItemStyle = json['brandItemStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['style'] = style;
    data['brandItemStyle'] = brandItemStyle;
    return data;
  }
}

class OffersStyle {
  String? style;
  String? offerItemStyle;

  OffersStyle({this.style, this.offerItemStyle});

  OffersStyle.fromJson(Map<dynamic, dynamic> json) {
    style = json['style'];
    offerItemStyle = json['offerItemStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['style'] = style;
    data['offerItemStyle'] = offerItemStyle;
    return data;
  }
}
