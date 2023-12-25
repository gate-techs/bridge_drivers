import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/image_loader.dart';
import 'package:kishk_driver/res/gaps.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/app_loading_widget.dart';

import '../controller/profile_controller/profile_cubit.dart';
import '../widgets/profile_list_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_profile'.tr,
            style: const TextStyle(
                color: MColors.colorPrimary, fontFamily: 'Tajawal')),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocProvider<ProfileCubit>(
          create: (_) => ProfileCubit()..getProfile(),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              ProfileCubit profileCubit = ProfileCubit.get(context);
              if (state is ProfileLoaded) {
                final data = state.profileData;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: ImageLoader.loadDefaultWithPlaceHolder(
                            data.image ?? '',
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "hi".tr,
                          style: const TextStyle(),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.hGap4,
                        Text(
                          data.name ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ProfileListSection(
                      mProfileDataRows: data,
                      onRefreshCallBack: () {
                        profileCubit.getProfile();
                      },
                    )
                  ],
                );
              } else if (state is ProfileFailed) {
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
