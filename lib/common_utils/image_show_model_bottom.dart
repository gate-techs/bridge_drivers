import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceBottomSheet extends StatelessWidget {
  const ImageSourceBottomSheet({
    super.key,
    required this.onSourceSelected,
  });

  final Function(ImageSource) onSourceSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.fromLTRB(5, 15, 5, 10),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Column(
                children: [
                  const Icon(
                    Icons.camera,
                    size: 24,
                  ),
                  Text(
                    'camera'.tr,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Tajawal",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () {
                onSourceSelected.call(ImageSource.camera);
                Get.back();
              },
            ),
            const SizedBox(
              width: 30,
            ),
            InkWell(
              child: Column(
                children: [
                  const Icon(
                    Icons.image,
                    size: 24,
                  ),
                  Text(
                    'gallery'.tr,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Tajawal",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () {
                onSourceSelected.call(ImageSource.gallery);
                Get.back();
              },
            ),
            // const SizedBox(
            //   width: 30,
            // ),
            // InkWell(
            //   child: Column(
            //     children: [
            //       const Icon(
            //         Icons.file_copy_outlined,
            //         size: 40,
            //       ),
            //       const SizedBox(
            //         height: 15,
            //       ),
            //       Text(
            //         'file'.tr,
            //         style: const TextStyle(
            //             color: Colors.black,
            //             fontFamily: "Tajawal",
            //             fontSize: 16,
            //             fontWeight: FontWeight.bold),
            //       )
            //     ],
            //   ),
            //   onTap: () {
            //     onSourceSelected.call(FileSources.file);
            //     Get.back();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
