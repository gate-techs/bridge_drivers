import 'package:flutter/foundation.dart';

class Apis {
  static const String urlScheme = 'https';

  static const String releaseTest = "api.bridgeskw.com";
  static const String releaseLive = "api.bridgeskw.com";

  static const String baseUrl =
      "$urlScheme://${kDebugMode ? releaseTest : releaseLive}/api/v1/";

  static const String doLoginApiCall = "backend/auth/login";
  static const String sendFcmToken = "fcm-token";
  static const String getProfileData = "me";
  static const String doLogoutApiCall = "logout";

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
