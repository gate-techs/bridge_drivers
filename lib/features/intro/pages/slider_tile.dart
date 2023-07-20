import 'package:flutter/material.dart';
import 'package:kishk_driver/res/m_colors.dart';


class SliderTile extends StatelessWidget {
  final String imagePath, title, desc;

  const SliderTile({super.key, required this.imagePath, required this.title, required this.desc});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 280,
              height: 280,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: MColors.moveColor, ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,

                  color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
