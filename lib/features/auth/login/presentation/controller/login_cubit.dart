import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/helpers/notifications_helper/send_fcm_repository.dart';

import '../../../../../common_utils/common_utils.dart';
import '../../../../main/main_screen.dart';
import '../../data/auth_data_entity.dart';
import '../../domain/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordObscure = true;

  void updateTextObscure() {
    passwordObscure = !passwordObscure;
    emit(LoginInitial());
  }

  LoginRepository loginRepository = LoginRepository();



  Future<void> doLoginApiCall() async {
    try {
      if (formKey.currentState!.validate()) {
        EasyLoading.show();
        final mResponse = await loginRepository.login({
          "email": emailController.text,
          "password": passwordController.text,
        });
        mResponse.fold((left) async {
          await EasyLoading.dismiss();
          CommonUtils.showToastMessage(left);
        }, (right) async {
          await EasyLoading.dismiss();
          Hive.box(HiveHelper.boxKeyUserData).put(
              HiveHelper.boxKeyUserData, right.data?.toJson());
          HiveHelper.setUserToken(right.data?.accessToken ?? '');
          HiveHelper.setLoginState(true);
          SendFcmRepository().sendFcmToken();
          Get.offAll(() => const MainScreen());
        });
      }} catch (e) {
      await EasyLoading.dismiss();
      CommonUtils.showToastMessage(e.toString(), status: 'rejected');
    }
  }
}
