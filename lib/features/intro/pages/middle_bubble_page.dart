import 'package:flutter/material.dart';

import '../slider_item.dart';
import 'slider_tile.dart';


class MediumBubblePage extends StatelessWidget {

  final PageSliderItem sliderItem;

  const MediumBubblePage({super.key,  required this.sliderItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * .1,
          child: SizedBox(
            height: 320,
            child: Image.asset("assets/background/bubble_circle.png"),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: 100,
            child: Image.asset("assets/background/left_small_intro.png"),
          ),
        ),
        SliderTile(
          title: sliderItem.title,
          desc: sliderItem.description,
          imagePath: sliderItem.imageUrl,
        )
      ],
    );
  }
}
