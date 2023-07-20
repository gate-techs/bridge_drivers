import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/auth/login/data/auth_data_entity.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';

import '../../../data/profile_entity.dart';
import '../../../domain/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileRerpository profileRerpository = ProfileRerpository();

  Future<void> getProfile() async {
    final resul = await profileRerpository.getProfile();
    resul.fold((l) {
      emit(ProfileFailed('unknown_error'.tr));
    }, (r) async {
      if (r.data == null) {
        emit(ProfileFailed("unknown_error".tr));
      } else {
        HiveHelper.setUserData(
            AuthDataData().copyWith(username: r.data!.rows!.name));
        emit(ProfileLoaded(r.data!.rows!));
      }
    });
  }
}
