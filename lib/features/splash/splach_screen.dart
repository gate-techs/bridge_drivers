import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/res/m_colors.dart';

import '../../shared/widgets/bottom_bar_screen.dart';
import '../auth/login/presentation/view/login_screen.dart';
import '../intro/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(milliseconds: 1700),
        () => Get.offAll(() =>
        // HiveHelper.getOnBoardingState() ?
        HiveHelper.getUserToken().isNotEmpty
                ? const BottomBarScreen()
                : const LoginScreen()
            // : const IntroScreen()
        ));

    return Scaffold(
      backgroundColor: MColors.moveColor,
      body: Center(
        child: Image.asset('assets/logo_splash.png'),
      ), //<- place where the image appears
    );
  }
}
