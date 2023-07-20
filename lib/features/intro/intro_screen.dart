import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/intro/slider_item.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/res/styles.dart';

import '../auth/login/presentation/view/login_screen.dart';
import 'pages/bubble_bottom_and_left.dart';
import 'pages/middle_bubble_page.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "/intro_route_name";

  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  final List<PageSliderItem> _sliders = [
    PageSliderItem(
      imageUrl: "assets/intro/slider_cart.png",
      title: "whatever_you_need".tr,
      description: "intro_text1".tr,
    ),
    PageSliderItem(
      imageUrl: "assets/intro/slider_visa.png",
      title: "compare_and_get".tr,
      description: "intro_text2".tr,
    ),
    PageSliderItem(
      imageUrl: "assets/intro/slider_find.png",
      title: "easy_to_find".tr,
      description: "intro_text3".tr,
    )
  ];
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    MStyles.changeStatusBarColor();
    final media = MediaQuery.of(context);
    final isLandscape = media.orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              HiveHelper.setOnBoardingState(true);
              Get.offAll(() => const LoginScreen());
            },
            child: Text(
              "skip".tr,
              style: const TextStyle(
                  color: MColors.greenColor, ),
            ),
            // color: Colors.transparent,
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) => setState(() => currentIndex = index),
                children: [
                  BubbleBottomAndLeftPage(
                    sliderItem: _sliders[0],
                  ),
                  MediumBubblePage(
                    sliderItem: _sliders[1],
                  ),
                  BubbleBottomAndLeftPage(
                    sliderItem: _sliders[2],
                  )
                ],
              ),
              Align(
                alignment:
                    isLandscape ? Alignment.centerLeft : Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                      right: isLandscape ? media.size.width * .7 : 0),
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++) _buildIndicator(i)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: index == currentIndex ? 30.0 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: index == currentIndex ? MColors.greenColor : Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
