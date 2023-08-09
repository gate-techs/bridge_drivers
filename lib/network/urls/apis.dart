import 'package:flutter/foundation.dart';
 class Apis {
  static const String urlScheme = 'https';

  static const String releaseTest = "bridgeskw.com";
  static const String releaseLive = "bridgeskw.com";

  static const String baseUrl =
      "$urlScheme://${kDebugMode ? releaseTest : releaseLive}/api/v1/";

  static const String doLoginApiCall = "login";
  static const String sendFcmToken = "fcm-token";
  static const String getProfileData = "me";
  static const String doLogoutApiCall = "logout";
  static const String doContactUsApiCall = "contacts";
  static const String getAboutApiCall = "pages/aboutus";

  static const String getAllInvoicesData = "invoices";
  static const String getAllUsersData = "users";
  static const String getNotificationsData = "myNotifications";
  static const String getBadgeCountData = "badgeCount";

  static const String getTotalCardsData = "reports/total-cards";

  static const String doForgetPasswordApiCall = "auth/forget-password";
  static const String doVerifyPasswordApiCall = "auth/verify-reset-password";
  static const String doResetPasswordApiCall = "auth/reset-new-password";

  static const String doChangePasswordApiCall = "me/changePassword";
  static const String doUpdateProfileApiCall = "auth/update-profile";
  static const String doRegisterApiCall = "register";

  static const String getOrdersDataApiCall = "myOrders";

  static String getOrderDetailsDataApiCall(id) => "myOrders/$id";

  static String updateOrderStatusApiCall(id) => "myOrders/$id/change-status";

  static String getProductDetailsDataApiCall(id) => "products/$id";


  static const String getOrdersCountApiCall = "myOrders/badgeCount";

  static String getUserDetailsData(id) => "$getAllUsersData/$id";

  static String deleteUserDetailsData(id) => "$getAllUsersData/$id";

  static String getInvoiceDetailsData(id) => "$getAllInvoicesData/$id";

  static String uploadReturnedInvoice(id) =>
      "$getAllInvoicesData/returned-voucher/$id/upload";

  static const String getClassificationsData = "classifications";
  static const String getVendorServicePlacesData = "VendorServicePlaces";
  static const String getVendorServicesData = "services";
  static const String getWorkingHoursData = "working/hours";
  static const String getVendorsFieldsData = "vendors/fields";
  static const String getVehiclesCategoryData = "vehicle-category";

  static String getMedicalSubCategoryData(dynamic id) =>
      "get/sub/medical/activity/$id";
}
