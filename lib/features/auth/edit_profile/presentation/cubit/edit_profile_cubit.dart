import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';
import 'package:kishk_driver/features/auth/profile/data/profile_entity.dart';

import '../../data/my_profile_response.dart';
import '../../domain/edit_profile_repository.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  EditProfileRepository mEditProfileRepository = EditProfileRepository();

  final ImagePicker mImagePicker = ImagePicker();

  File? driverImage;

  Future<void> setDriverImage(ImageSource selectedSource) async {
    final XFile? pickedImage =
        await mImagePicker.pickImage(source: selectedSource);
    if (pickedImage != null) {
      driverImage = File(pickedImage.path);
      emit(EditProfileInitial());
    }
  }

  TextEditingController mNameController = TextEditingController();

  TextEditingController mEmailController = TextEditingController();

  TextEditingController mPhoneController = TextEditingController();

  initData(ProfileDataRows mProfileDataRows) {
    mNameController.text = mProfileDataRows.name ?? '';
    mEmailController.text = mProfileDataRows.email ?? '';
    mPhoneController.text = mProfileDataRows.mobile ?? '';
  }

  Future<void> updateProfileData() async {
    try {
      await EasyLoading.show(status: 'loading'.tr);
      FormData mFormData = FormData.fromMap({
        if (driverImage != null)
          'image': await MultipartFile.fromFile(driverImage!.path),
        'name': mNameController.text,
        'email': mEmailController.text,
        'mobile': mPhoneController.text,
      });
      final mResponse =
          await mEditProfileRepository.updateProfileApiCall(mFormData);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(EditProfileError(left));
      }, (right) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage('ok'.tr);
        emit(EditProfileLoaded(right));
      });
    } catch (e) {
      await EasyLoading.dismiss();

      emit(EditProfileError("empty_data".tr));

      Log.e(e.toString());
    }
  }
}
