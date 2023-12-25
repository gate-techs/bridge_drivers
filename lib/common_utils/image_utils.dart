import 'package:flutter/material.dart';

class ImageUtils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getAssetsPath(String name, String folder,
      {String format = 'png'}) {
    return 'assets/$folder/$name.$format';
  }

  static String getGifPath(String name, {String format = 'gif'}) {
    return 'assets/gif/$name.$format';
  }

  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg = "assets/images/icon"}) {
    if (imageUrl.isEmpty) {
      return AssetImage(getImagePath(holderImg));
    }
    return AssetImage(getImagePath(holderImg));
  }

  //HomeBottomNavIcons
  static const String svgHomeIcon = 'assets/svg/ic_home_outlined.svg';
  static const String svgAdd = 'assets/svg/ic_plus.svg';
  static const String svgHomeIconActive = 'assets/svg/ic_home.svg';
  static const String svgHeartIcon = 'assets/svg/ic_heart.svg';
  static const String svgHeartIconActive = 'assets/svg/ic_active_heart.svg';
  static const String svgBrandsIconActive = 'assets/svg/ic_brands.svg';
  static const String svgBrandsIcon= 'assets/svg/ic_brand.svg';
  static const String svgOffersIconActive = 'assets/svg/ic_offers_bag.svg';
  static const String svgCartIcon = 'assets/svg/ic_cart.svg';
  static const String svgCartIconActive = 'assets/svg/ic_cart_active.svg';
  static const String svgProfileIcon = 'assets/svg/ic_profile.svg';
  static const String svgOrdersIcon = 'assets/svg/ic_orders.svg';
  static const String svgLocationIcon = 'assets/svg/ic_location.svg';
  static const String svgLocation2Icon = 'assets/svg/ic_Location2.svg';
  static const String svgProfileIconActive = 'assets/svg/ic_active_profile.svg';
  static const String svgTick = 'assets/svg/ic_tick-circle.svg';
  static const String svgNoFav = 'assets/svg/ic_no_fav.svg';
  static const String svgNoCart = 'assets/svg/ic_no_cart.svg';
  static const String svgEmail = 'assets/svg/ic_email.svg';
  static const String svgWhatsaap= 'assets/svg/ic_whatsapp.svg';
  static const String svgKwait= 'assets/svg/ic_kuwait.svg';
  static const String svgUK= 'assets/svg/ic_united_kingdom.svg';

//Icons
  static const String svgNotificationsIcon = 'assets/svg/ic_notification.svg';
  static const String svgTrashIcon = 'assets/svg/ic_trash.svg';
  static const String svgMinus= 'assets/svg/ic_minus.svg';
  static const String svgAddIcon = 'assets/svg/ic_add.svg';
  static const String svgMinusIcon = 'assets/svg/ic_minus.svg';
  static const String svgSearchIcon = 'assets/svg/ic_search.svg';
  static const String svgLanguageIcon = 'assets/svg/language.svg';
  static const String svgLockIcon = 'assets/svg/ic_lock.svg';
  static const String svContactUsIcon = 'assets/svg/ic_contact_us.svg';
  static const String svAboutUsIcon = 'assets/svg/ic_question.svg';
  static const String svLoginIcon = 'assets/svg/ic_login.svg';
  static const String svALockIcon = 'assets/svg/ic_lock.svg';
  static const String svALogoutIcon = 'assets/svg/ic_logout.svg';
  static const String svgCouponIcon = 'assets/svg/ic_coupon.svg';
  static const String svgNoNotificationIcon = 'assets/svg/ic_no_notifaction.svg';
  static const String svgNotificationIconCopy = 'assets/svg/ic_notification_copy.svg';

  //Images
  static const String product1 = 'assets/images/product1.png';
  static const String product2 = 'assets/images/product2.png';
  static const String product3 = 'assets/images/product3.png';
}
