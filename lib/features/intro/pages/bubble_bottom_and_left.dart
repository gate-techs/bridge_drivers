import 'package:flutter/material.dart';

import '../slider_item.dart';
import 'slider_tile.dart';


class BubbleBottomAndLeftPage extends StatelessWidget {
  final PageSliderItem sliderItem;

  const BubbleBottomAndLeftPage({super.key,  required this.sliderItem}) ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: 200,
            child: Image.asset("assets/background/bubble_up.png"),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            height: 200,
            child: Image.asset("assets/background/left_big_intro.png"),
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
