import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kishk_driver/common_utils/image_loader.dart';
import 'package:kishk_driver/common_utils/image_show_model_bottom.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/res/styles.dart';

import '../../profile/data/profile_entity.dart';
import 'cubit/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen(
      {super.key,
      required this.mProfileDataRows,
      required this.onRefreshCallBack});

  final ProfileData mProfileDataRows;
  final Function() onRefreshCallBack;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit()..initData(mProfileDataRows),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoaded) {
            Get.back();
            onRefreshCallBack.call();
          }
        },
        builder: (context, state) {
          EditProfileCubit mEditProfileCubit = EditProfileCubit.get(context);

          return Scaffold(
             appBar: AppBar(
              title: Text(
                "my_profile".tr,
                style: const TextStyle(
                    color: MColors.colorPrimary,
                    fontFamily: 'Tajawal'),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: MColors.colorPrimary),
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                ),
              ),
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: mEditProfileCubit.driverImage != null
                              ? Image.file(mEditProfileCubit.driverImage!,
                                  fit: BoxFit.cover, width: 120, height: 120)
                              : ImageLoader.loadDefaultWithPlaceHolder(
                                  mProfileDataRows.image ?? '',
                                  fit: BoxFit.cover,
                                  width: 120,
                                  height: 120),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(24))),
                                  context: context,
                                  builder: (context) => ImageSourceBottomSheet(
                                        onSourceSelected: (ImageSource source) {
                                          mEditProfileCubit
                                              .setDriverImage(source);
                                        },
                                      ));
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25.0, left: 20, right: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                controller: mEditProfileCubit.mNameController,
                                decoration:
                                    MStyles.textFieldDecoration("user_name".tr),
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  // name = value;
                                },
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20, right: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                controller: mEditProfileCubit.mEmailController,
                                decoration:
                                    MStyles.textFieldDecoration("email".tr),
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  // email = value;
                                },
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20, right: 20),
                            child: TextFormField(
                              controller: mEditProfileCubit.mPhoneController,
                              decoration:
                                  MStyles.textFieldDecoration("phone".tr),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                // phone = value;
                              },
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 50.0, left: 20),
                              child: SizedBox(
                                width: 130,
                                height: 42,
                                child: ElevatedButton(
                                  onPressed: () {
                                    mEditProfileCubit.updateProfileData();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MColors.greenColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ))),
                                  child: Text(
                                    "save".tr,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
