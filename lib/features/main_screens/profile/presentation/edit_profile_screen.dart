
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kishk_driver/features/main_screens/profile/presentation/profile_cubit/profile_cubit.dart';
import '../../../../common_utils/common_utils.dart';
import '../../../../common_utils/log_utils.dart';
import '../../../../country_code/country_code.dart';
import '../../../../main.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../../res/styles.dart';
import '../../../../shared/error_widget.dart';
import '../../../../shared/loading_widget.dart';
import 'edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.screensBackgroundColor,
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          "profile".tr,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: appFontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Log.e(Get.routeTree.routes.toString());
            Get.back(result: {'refresh': true});
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider<ProfileCubit>(
          create: (_) => ProfileCubit()..getProfile(),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              ProfileCubit profileCubit = ProfileCubit.get(context);
              if (state is ProfileLoaded) {
                final data = state.profileData;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Gaps.vGap16,
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: MColors.deliveredColor),
                                color: MColors.deliveredColor),
                            width: 120,
                            height: 120,
                            alignment: Alignment.center,
                            child: Text(
                              data.name?.substring(0, 1) ?? '',
                              style: TextStyle(
                                  color: MColors.colorPrimary, fontSize: 50),
                            ),
                          ),
                        ),
                      ),
                      Gaps.vGap16,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MColors.veryLightGray,
                        ),
                        child: TextFormField(
                          controller: profileCubit.nameController,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff212121),
                          ),
                          decoration: MStyles.textFieldStyle(
                              "name".tr,
                              const Icon(
                                Icons.person_2_outlined,
                                color: Colors.grey,
                              ),
                              null),
                        ),
                      ),
                      Gaps.vGap16,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MColors.veryLightGray,
                        ),
                        child: TextFormField(
                          controller: profileCubit.emailController,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff212121),
                          ),
                          decoration: MStyles.textFieldStyle(
                              "email".tr,
                              const Icon(
                                Icons.mail_outline_outlined,
                                color: Colors.grey,
                              ),
                              null),
                        ),
                      ),
                      Gaps.vGap16,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MColors.veryLightGray,
                        ),
                        child: CountryCode(
                          isClickable: false,
                          phoneNumber: PhoneNumber(
                              isoCode: CommonUtils.countryCodeList
                                      ?.firstWhere((element) {
                                    return element.code ==
                                        profileCubit.myCountry;
                                  }).isoCode ??
                                  'KW',
                              dialCode: profileCubit.countryController.text,
                              phoneNumber:
                                  profileCubit.phoneEditingController.text),
                          onChangedCallBack: (value, controller) {
                            profileCubit.phoneEditingController.text =
                                controller.text;
                            profileCubit.countryController.text =
                                value.dialCode ?? '';
                          },
                        ),
                      ),
                      Gaps.vGap30,
                      BlocProvider(
                        create: (context) => EditProfileCubit(),
                        child: BlocConsumer<EditProfileCubit, EditProfileState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            final cubit =
                                BlocProvider.of<EditProfileCubit>(context);
                            return InkWell(
                              onTap: () {
                                cubit.editProfile({
                                  'name': profileCubit.nameController.text,
                                  'email': profileCubit.emailController.text,
                                  'country_code':
                                      profileCubit.countryController.text,
                                  'mobile':
                                      profileCubit.phoneEditingController.text,
                                });
                              },
                              child: Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: MColors.colorPrimary,
                                    borderRadius: BorderRadius.circular(66)),
                                child: Center(
                                  child: Text(
                                    'edit'.tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      shadows: [
                                        BoxShadow(
                                          color: MColors.colorPrimary,
                                          offset: const Offset(4, 8),
                                          blurRadius: 24,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is ProfileFailed) {
                return FailedWidget(
                  failedMessage: state.message,
                );
              } else {
                return const Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: LoadingWidget(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
