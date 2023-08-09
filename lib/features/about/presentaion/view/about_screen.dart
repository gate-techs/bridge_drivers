import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/app_loading_widget.dart';

import '../controller/about_cubit.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "about".tr,
          style: const TextStyle(
            color: MColors.blueColor,
            fontWeight: FontWeight.w400,
            fontFamily: 'Tajawal',
          ),
        ),
        leading: IconButton(
          icon: HiveHelper.getAppLanguage() == 'en'
              ? Image.asset(
                  'assets/icons/back_icon.png',
                  width: 28,
                  height: 28,
                )
              : Image.asset(
                  'assets/icons/profile_back.png',
                  width: 18,
                  height: 16,
                ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocProvider<AboutCubit>(
          create: (_) => AboutCubit()..about(),
          child: BlocConsumer<AboutCubit, AboutState>(
            listener: (context, state) {},
            builder: (context, state) {
              // AboutCubit aboutCubit = AboutCubit.get(context);
              if (state is AboutLoaded) {
                final data = state.aboutData;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 200,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        data,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            ),
                      )
                    ],
                  ),
                );
              } else if (state is AboutFailed) {
                final data = state.message;
                return Center(
                  child: Text(
                    data,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: AppLoadingWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
