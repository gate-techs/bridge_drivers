import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hive/hive.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/helpers/notifications_helper/send_fcm_repository.dart';

import '../../data/auth_data_entity.dart';
import '../../domain/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginCubit get(context) => BlocProvider.of(context);

  final form = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  var showSpinner = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool passwordvisable = true;
  String email = '';
  String password = '';

  LoginRepository loginRepository = LoginRepository();



  Future<void> login(Map<String, dynamic> params) async {
    EasyLoading.show(status: 'loading'.tr);
    final resul = await loginRepository.login(params);
    resul.fold((l) {
      EasyLoading.dismiss();
      emit(LoginFailed(l));
    }, (r) async {
      if (r.data == null) {
        EasyLoading.dismiss();
        emit(LoginFailed('empty_data'.tr));
      }
      else {
        await EasyLoading.dismiss();
        Hive.box(HiveHelper.boxKeyUserData).put(
            HiveHelper.boxKeyUserData, r.data?.toJson());
        HiveHelper.setUserToken(r.data?.accessToken ?? '');

        HiveHelper.setLoginState(true);
        SendFcmRepository().sendFcmToken();
        emit(LoginSuccess(r.data!));
      }
    });
  }
}
