import 'package:flutter/material.dart';

import '../../../../../common_utils/image_loader.dart';


class HorizontalPhotosCardListItem extends StatelessWidget {
  const HorizontalPhotosCardListItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(2),
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          16,
        ),
        child: ImageLoader.loadDefaultWithPlaceHolder(
            width: 100,
            height: 120,
            image,
            fit: BoxFit.fill),
      ),
    );
  }
}
