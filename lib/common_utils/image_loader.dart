import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'image_utils.dart';

class ImageLoader {
  static loadDefaultWithPlaceHolder(String? url,
      {BoxFit fit = BoxFit.fill,
        double height = double.infinity,
        double width = double.infinity,
        Alignment alignment = Alignment.center,
        bool isImageProvider = false}) {
    return isImageProvider
        ? CachedNetworkImageProvider(
      url ?? '',
    )
        : CachedNetworkImage(
      imageUrl: url ?? '',
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(
              child: Lottie.asset('assets/lottie/loading.json',
                  width: 200, height: 200)
          ),
      errorWidget: (context, url, error) =>
          Image(image: AssetImage(ImageUtils.getImagePath('default'))),
      // Image.asset(ImageUtils.getImagePath('img-placeholder')),
    );
  }
}
