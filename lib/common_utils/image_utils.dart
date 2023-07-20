class ImageUtils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getSVGPath(String name, {String format = 'svg'}) {
    return 'assets/svg/$name.$format';
  }

  //HomeBottomNavIcons
  static const String svgHomeIcon = 'assets/svg/ic_home_outlined.svg';
  static const String svgHomeIconActive = 'assets/svg/ic_home.svg';
  static const String svgHeartIcon = 'assets/svg/ic_heart.svg';
  static const String svgHeartIconActive = 'assets/svg/ic_active_heart.svg';
  static const String svgCartIcon = 'assets/svg/ic_cart.svg';
  static const String svgCartIconActive = 'assets/svg/ic_cart_active.svg';
  static const String svgProfileIcon = 'assets/svg/ic_profile.svg';
  static const String svgProfileIconActive = 'assets/svg/ic_active_profile.svg';

//Icons
  static const String svgNotificationsIcon = 'assets/svg/ic_notification.svg';
  static const String svgTrashIcon = 'assets/svg/ic_trash.svg';
  static const String svgAddIcon = 'assets/svg/ic_add.svg';
  static const String svgMinusIcon = 'assets/svg/ic_minus.svg';
  static const String svgSearchIcon = 'assets/svg/ic_search.svg';
  static const String svgLanguageIcon = 'assets/svg/ic_earth_global.svg';
  static const String svContactUsIcon = 'assets/svg/ic_contact_us.svg';
  static const String svAboutUsIcon = 'assets/svg/ic_info.svg';
  static const String svALockIcon = 'assets/svg/ic_lock.svg';
  static const String svALogoutIcon = 'assets/svg/ic_logout.svg';
}
