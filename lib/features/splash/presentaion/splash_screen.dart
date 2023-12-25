import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../helpers/hive_helper.dart';
import '../../auth/login/presentation/view/login_screen.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      if (!HiveHelper.getLoginState()) {
        Get.offAll(() => const LoginScreen());
      }else {
        Get.offAll(() => const MainScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: AspectRatio(
      aspectRatio:
          MediaQuery.sizeOf(context).width / MediaQuery.sizeOf(context).height,
      child: BlocProvider(
        create: (context) => SplashCubit()..getVendorDetails(),
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Center(
                child: Image.asset('assets/images/logo.jpeg')
            );
          },
        ),
      ),
    ));
  }

}
