import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kishk_driver/res/m_colors.dart';

class ImageLoader {
  static CachedNetworkImage loadDefault(String url,
      {BoxFit fit = BoxFit.scaleDown,
      double height = double.infinity,
      double width = double.infinity,
      Icon? iconPlaceholder}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) =>
          iconPlaceholder ??
          Image.asset(
            'assets/logo.png',
            color: MColors.colorPrimary,
            fit: fit,
          ),
      errorWidget: (context, url, error) =>
          iconPlaceholder ??
          Image.asset(
            'assets/logo.png',
            color: MColors.colorPrimary,
            fit: fit,
          ),
    );
  }

  static CachedNetworkImage loadDefaultWithPlaceHolder(
    String? url, {
    BoxFit fit = BoxFit.scaleDown,
    double height = double.infinity,
    double width = double.infinity,
  }) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      height: height,
      width: width,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: Image.asset(
            'assets/logo.png',
        fit: fit,
      )),
      errorWidget: (context, url, error) => Image.asset(
        'assets/logo.png',
        fit: fit,
      ),
      // Image.asset(ImageUtils.getImagePath('img-placeholder')),
    );
  }

  static CachedNetworkImage loadNoPlaceHolder(String url,
      {BoxFit fit = BoxFit.fill,
      double height = double.infinity,
      double width = double.infinity}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
    );
  }

  static CachedNetworkImage loadDefaultA(String url,
      {BoxFit fit = BoxFit.scaleDown,
      double height = double.infinity,
      double width = double.infinity,
      Icon? iconPlaceholder}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) =>
          iconPlaceholder ??
          Image.asset(
            'assets/logo.png',
            fit: fit,
          ),
      errorWidget: (context, url, error) =>
          iconPlaceholder ??
          Image.asset(
            'assets/logo.png',
            fit: fit,
          ),
    );
  }
}
