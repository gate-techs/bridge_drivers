import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/common_utils/image_utils.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/res/m_colors.dart';
import '../../../../../shared/widgets/error_dialog.dart';
import '../../../../about/presentaion/view/about_screen.dart';
import '../../../../contact_us/presentation/view/contact_us_screen.dart';
import '../../../edit_profile/presentation/edit_profile_screen.dart';
import '../../../login/presentation/view/login_screen.dart';
import '../../data/profile_entity.dart';
import '../controller/logout_controller/logout_cubit.dart';
import 'change_language_dialog.dart';

class ProfileListSection extends StatelessWidget {
  const ProfileListSection({
    super.key,
    required this.mProfileDataRows,
    required this.onRefreshCallBack,
  });

  final ProfileData mProfileDataRows;
  final Function() onRefreshCallBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          buildListItem(context, ImageUtils.svgProfileIconActive, "my_profile".tr,
              () {
            Get.to(() => EditProfileScreen(
                  mProfileDataRows: mProfileDataRows,
                  onRefreshCallBack: () => onRefreshCallBack.call(),
                ));
          }),
          buildListItem(context, ImageUtils.svgLanguageIcon, "language".tr, () {
            showDialog(
                context: context, builder: (ctx) => const LanguageDialog());
          }),
          buildListItem(context, ImageUtils.svContactUsIcon, "contact".tr, () {
            Get.to(() => ContactUsScreen(
                  userName: mProfileDataRows.name ?? '',
                  userEmail: mProfileDataRows.email ?? '',
                ));
          }),
          buildListItem(context, ImageUtils.svAboutUsIcon, "about".tr, () {
            Get.to(const AboutScreen());
          }),
          BlocProvider<LogoutCubit>(
              create: (context) => LogoutCubit(),
              child: BlocConsumer<LogoutCubit, LogoutState>(
                  listener: (BuildContext context, LogoutState state) {
                if (state is LogoutSuccess) {
                  Get.offAll(const LoginScreen());
                } else if (state is LogoutFailed) {
                  showDialog(
                      context: context,
                      builder: (ctx) =>
                          ErrorDialog(errorMessage: state.message));
                }
              }, builder: (BuildContext context, LogoutState state) {
                LogoutCubit logoutCubit = LogoutCubit.get(context);
                return Column(
                  children: [
                    // buildListItem(context, ImageUtils.svALockIcon,
                    //     "change_password".tr, () {
                    //   showDialog(
                    //       context: context,
                    //       builder: (ctx) => ChangePasswordDialog(
                    //             onSubmitChangePasswordCallBack:
                    //                 (String newPass, String newPassConfirm) {
                    //               logoutCubit.changePassword({
                    //                 "old_password": '',
                    //                 "password": newPass,
                    //                 "password_confirmation": newPassConfirm
                    //               });
                    //             },
                    //           ));
                    // }),
                    buildListItem(
                        context, ImageUtils.svALogoutIcon, "logout".tr,
                        () async {
                      logoutCubit.logout();
                    }),
                  ],
                );
              })),
        ],
      ),
    );
  }

  Widget buildListItem(
      BuildContext context, String imageUrl, String title, Function()? press) {
    return InkWell(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 40,
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MColors.blueColor)),
        child: Row(
          children: [
            SvgPicture.asset(
              imageUrl,
              width: 35,
              height: 35,
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                height: 2
              ),
            )),
            HiveHelper.getAppLanguage() == 'en'
                ? Image.asset(
                    "assets/icons/profile_back.png",
                    width: 18,
                    height: 18,
              color: MColors.blueColor,
                  )
                : Image.asset(
                    "assets/icons/back_icon.png",
                    width: 24,
                    height: 24,
              color: MColors.blueColor,

            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
