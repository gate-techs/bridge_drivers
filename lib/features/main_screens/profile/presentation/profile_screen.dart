import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/main_screens/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:kishk_driver/features/main_screens/profile/presentation/widgets/language_show_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common_utils/common_utils.dart';
import '../../../../common_utils/image_loader.dart';
import '../../../../common_utils/image_utils.dart';
import '../../../../helpers/hive_helper.dart';
import '../../../../main.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../../shared/error_widget.dart';
import '../../../../shared/loading_widget.dart';
import '../../../about/presentaion/about_screen.dart';
import '../../../splash/data/vendor_entity.dart';
import 'app_pages/app_pages_cubit.dart';
import 'logout_cubit/logout_cubit.dart';
import 'social_media/social_media_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'settings'.tr,
      //     style: TextStyle(color: Colors.black, fontFamily: appFontFamily),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(onPressed: () {
      //     Get.back();
      //   },icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocProvider<ProfileCubit>(
            create: (_) => ProfileCubit()..getProfile(),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {},
              builder: (context, state) {
                ProfileCubit profileCubit = ProfileCubit.get(context);
                if (state is ProfileLoaded) {
                  final data = state.profileData;
                  return RefreshIndicator(
                    onRefresh: () async {
                      profileCubit.getProfile();
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Gaps.vGap4,
                         Column(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(60),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                            MColors.deliveredColor),
                                    ),
                                    width: 120,
                                    height: 120,
                                    alignment: Alignment.center,
                                    child: ImageLoader.loadDefaultWithPlaceHolder(data.image),
                                  ),
                                ),
                              ),
                              Gaps.vGap4,
                              Text(
                                data.name ?? '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                data.email ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Gaps.vGap16,
                              // buildListItem(
                              //     context,
                              //     ImageUtils.svgProfileIcon,
                              //     "profile".tr, () async {
                              //   var res = await Get.to(
                              //           () => const EditProfileScreen());
                              //   if (res['refresh'] == true) {
                              //     profileCubit.getProfile();
                              //   }
                              // }),
                              // buildListItem(
                              //     context,
                              //     ImageUtils.svgLockIcon,
                              //     "changePassword".tr, () {
                              //   Get.to(
                              //           () => const ChangePasswordScreen());
                              // }),
                            ],
                          ),

                          buildListItem(context, ImageUtils.svgLanguageIcon,
                              "language".tr, () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    backgroundColor: Colors.white,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return LanguageBottomSheet(
                                        callBack: () {
                                          profileCubit.getProfile();
                                          profileCubit.mSocialMediaCubit
                                              ?.getSocialLinks();
                                          profileCubit.mAppPagesCubit
                                              ?.getAppPages();
                                        },
                                      );
                                    });
                              }),
                          // buildListItem(context, ImageUtils.svContactUsIcon,
                          //     "contactUs".tr, () {
                          //       Get.to(() => ContactUsScreen(
                          //         profileRow: data,
                          //       ));
                          //     }),
                          Gaps.vGap16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'followUsOn'.tr,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Gaps.vGap16,
                              BlocProvider(
                                create: (context) =>
                                SocialMediaCubit()..getSocialLinks(),
                                child: BlocConsumer<SocialMediaCubit,
                                    SocialMediaState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    profileCubit.mSocialMediaCubit =
                                        SocialMediaCubit.get(context);
                                    if (state is SocialMediaLoaded) {
                                      return SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: ListView.builder(
                                              itemCount: state.data?.length,
                                              shrinkWrap: true,
                                              scrollDirection:
                                              Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  SocialItem(
                                                      state.data![index])),
                                        ),
                                      );
                                    } else if (state is SocialMediaLoading) {
                                      return const LoadingWidget();
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          BlocProvider(
                            create: (context) =>
                            AppPagesCubit()..getAppPages(),
                            child: BlocConsumer<AppPagesCubit, AppPagesState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                profileCubit.mAppPagesCubit =
                                    AppPagesCubit.get(context);
                                if (state is AppPagesLoaded) {
                                  return Column(
                                    children: state.data!.map((e) {
                                      var title =
                                      HiveHelper.getAppLanguage() == 'ar'
                                          ? e.ar?.title ?? ''
                                          : e.en?.title ?? '';
                                      return buildListItem(
                                          context,
                                          ImageUtils.svAboutUsIcon,
                                          title, () {
                                        Get.to(AboutScreen(
                                          page: e.encryptId!,
                                          title: title,
                                        ));
                                      });
                                    }).toList(),
                                  );
                                } else if (state is AppPagesLoading) {
                                  return const LoadingWidget();
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                          Gaps.vGap16,
                          Center(
                            child: Text(
                              'enjoying'.tr,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: InkWell(
                              onTap: () async {
                                if (HiveHelper.getVendorApp()!.appLogo !=
                                    null) {
                                  await profileCubit.saveAppImageToShare(
                                      HiveHelper.getVendorApp()!.appLogo!);
                                }
                              },
                              child: Container(
                                width: 200,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    color: MColors.colorPrimary,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                    child: Text(
                                      'shareApp'.tr,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                          ),
                          Gaps.vGap16,
                          if (HiveHelper.getUserToken().isNotEmpty)
                            BlocProvider(
                              create: (context) => LogoutCubit(),
                              child: BlocConsumer<LogoutCubit, LogoutState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  LogoutCubit mLogoutCubit =LogoutCubit.get(context);
                                  return InkWell(
                                    onTap: () {
                                      HiveHelper.clearUserData();
                                      setState(() {});

                                      mLogoutCubit.doLogoutApiCall();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                          color: MColors.colorPrimary,
                                          borderRadius:
                                          BorderRadius.circular(66)),
                                      child: Center(
                                        child: Text(
                                          'logout'.tr,
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
                            ),
                        ],

                      ),
                    ),
                  );
                } else if (state is ProfileFailed) {
                  return FailedWidget(
                    failedMessage: state.message,
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: LoadingWidget(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SocialItem extends StatelessWidget {
  const SocialItem(this.socialMedia, {super.key});

  final PaymentMethods socialMedia;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () {
          CommonUtils.launchInWebViewWithoutJavaScript(socialMedia.value ?? '',
              mode: LaunchMode.externalApplication);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageLoader.loadDefaultWithPlaceHolder(
                  socialMedia.media?.url ?? '',
                  width: 36,
                  height: 36),
            ),
            Gaps.vGap4,
            Text(
              socialMedia.title ?? '',
              style: TextStyle(fontFamily: appFontFamily),
            )
          ],
        ),
      ),
    );
  }
}

class CircleItem extends StatelessWidget {
  const CircleItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final Function() onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: MColors.appInputColor.withOpacity(0.5),
                shape: BoxShape.circle),
            child: SvgPicture.asset(icon, width: 24, height: 24),
          ),
          Gaps.vGap4,
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

Widget buildListItem(
    BuildContext context, String imageUrl, String title, Function()? press) {
  return InkWell(
    onTap: press,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MColors.appInputColor)),
      child: Row(
        children: [
          SvgPicture.asset(
            imageUrl,
            width: 28,
            height: 28,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    ),
  );
}
