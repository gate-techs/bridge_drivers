import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../common_utils/image_loader.dart';
import '../common_utils/image_utils.dart';
import '../helpers/hive_helper.dart';

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: HiveHelper.getAppLanguage()=='ar'?Alignment.topRight:Alignment.topLeft,
          children: [
            PhotoView(
                imageProvider: ImageLoader.loadDefaultWithPlaceHolder(
                    widget.imgUrl,
                    fit: BoxFit.cover,
                    isImageProvider: true),
                errorBuilder:(context, error, stackTrace) =>  Image(
                    image: AssetImage(ImageUtils.getImagePath('logo'))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
