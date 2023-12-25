import 'package:flutter/foundation.dart';

class Apis {
  static const String urlScheme = 'https';

  static const String debug = "api-test-multivendor.mazadak.net/api/v1/";

  static const String release = "api.bridgeskw.com/api/v1/";

  static const String baseUrl = "$urlScheme://${kDebugMode ? debug : release}";

  static const String appId = "uCwJMa1md7XFhVZ";

  static const String getCountryCodeData = "countries";
  static String getVendorDetails = "appSettings";

  static const String doLoginApiCall = "backend/auth/login";
  static const String sendFcmToken = "fcmToken";
  static const String getProfileData = "auth/me";
  static const String doLogoutApiCall = "auth/logout";

  static const String doContactUsApiCall = "contacts";
  static const String getAboutApiCall = "pages/aboutus";

  static const String getNotificationsData = "notifications";
  static const String getBadgeCountData = "notifications/badgeCount";

  static const String getTotalCardsData = "reports/total-cards";

  static const String doForgetPasswordApiCall = "auth/forget-password";
  static const String doVerifyPasswordApiCall = "auth/verify-reset-password";
  static const String doResetPasswordApiCall = "auth/reset-new-password";

  static const String doChangePasswordApiCall = "me/changePassword";
  static const String doUpdateProfileApiCall = "auth/update-profile";
  static const String doRegisterApiCall = "register";

  static const String getOrdersDataApiCall = "driver/recentOrders";

  static String getOrderDetailsDataApiCall(id) => "showOrder/$id";

  static String updateOrderStatusApiCall(id) =>
      "driver/recentOrders/$id/change-status";

  static String getProductDetailsDataApiCall(id) => "products/$id";

  static const String getOrdersCountApiCall = "driver/recentOrders";
}
