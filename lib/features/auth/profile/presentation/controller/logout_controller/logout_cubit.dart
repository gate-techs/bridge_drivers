import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';

import '../../../domain/logout_repository.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  static LogoutCubit get(context) => BlocProvider.of(context);

  LogoutRepository logoutRerpository = LogoutRepository();

  Future<void> logout() async {
    EasyLoading.show(status: 'loading'.tr);
    final resul = await logoutRerpository.logout();
    resul.fold((l) {
      EasyLoading.dismiss();
      emit(LogoutFailed(l));
    }, (r) async {
      EasyLoading.dismiss();
      HiveHelper.clearUserData();
      emit(LogoutSuccess(r));
    });
  }

  // Future<void> changePassword(Map<String, dynamic> params) async {
  //   EasyLoading.show(status: 'loading'.tr);
  //   final resul = await logoutRerpository.changePassword(params);
  //   resul.fold((l) {
  //     EasyLoading.dismiss();
  //     emit(LogoutFailed(l));
  //   }, (r) async {
  //     EasyLoading.dismiss();
  //     CommonUtils.showToastMessage('ok'.tr);
  //     // emit(LogoutSuccess('ok'.tr));
  //   });
  // }
}
