import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../../helpers/hive_helper.dart';
import '../../../../../res/m_colors.dart';
import '../../../../auth/login/presentation/view/login_screen.dart';
import '../../domain/logout_repository.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  static LogoutCubit get(context) => BlocProvider.of(context);
  LogoutRepository mLogoutRepository = LogoutRepository();

  Future<void> doLogoutApiCall() async {
    try {
      EasyLoading.show(
        status: 'loading'.tr,
        indicator: SpinKitChasingDots(
          color: MColors.colorPrimary,
          size: 100,
        ),
      );
      final mResponse = await mLogoutRepository.logout();
      mResponse.fold((l) async {
        await EasyLoading.dismiss();
        EasyLoading.showError(l);
      }, (right) async {
        await EasyLoading.dismiss();
        HiveHelper.clearUserData();
        Get.offAll(() => const LoginScreen());
      });
    } catch (e) {
      await EasyLoading.dismiss();
      EasyLoading.showError(
        e.toString()
      );
    }
  }
}
