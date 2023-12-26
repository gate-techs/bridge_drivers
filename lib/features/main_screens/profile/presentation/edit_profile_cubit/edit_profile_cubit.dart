import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import '../../../../../res/m_colors.dart';
import '../../../../main/main_screen.dart';
import '../../domain/edit_profile_repository.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  EditProfileRepository editProfileRepository = EditProfileRepository();

  Future<void> editProfile(Map<String, dynamic> params) async {
    EasyLoading.show(
        status: 'loading'.tr,
        indicator: SpinKitChasingDots(
          color: MColors.colorPrimary,
          size: 100,
        ),
      );
    final resul = await editProfileRepository.editProfile(params);
    resul.fold((l) {
      EasyLoading.dismiss();
      EasyLoading.showError(l);

      emit(EditProfileFailed(l));
    }, (r) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess(r);
      Get.offAll(const MainScreen());
      emit(EditProfileSuccess(r));
    });
  }
}
