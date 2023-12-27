import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../common_utils/image_loader.dart';
import '../../../../common_utils/image_utils.dart';


class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key, required this.imgUrl, });
  final String imgUrl;


  @override
  Widget build(BuildContext context) {
    return  Dialog(
      insetPadding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        width: 400,
        height: 400,
        color: Colors.transparent,
        child: PhotoView(
          minScale: PhotoViewComputedScale.contained *  1.0,
          maxScale: PhotoViewComputedScale.covered * 1.0,
          // enableRotation: true,
          scaleStateController: PhotoViewScaleStateController(),
          backgroundDecoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 6),
                blurRadius: 6,
                spreadRadius: 0,
              )
            ]),
          imageProvider:ImageLoader.loadDefaultWithPlaceHolder(
            imgUrl,
            fit: BoxFit.cover,
            isImageProvider: true,),
          errorBuilder:(context, error, stackTrace) =>  Image(
              image: AssetImage(ImageUtils.getImagePath('logo'))),
        ),
      ),
    );

  }
}
