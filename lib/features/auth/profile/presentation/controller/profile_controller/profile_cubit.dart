import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


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
        emit(ProfileLoaded(r.data!));
      }
    });
  }
}
