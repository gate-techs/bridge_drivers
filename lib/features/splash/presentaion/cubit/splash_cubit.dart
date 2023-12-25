import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hive/hive.dart';

import '../../../../helpers/hive_helper.dart';
import '../../data/vendor_entity.dart';
import '../../domain/vendor_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(context) => BlocProvider.of(context);

  VendorRepository vendorRepository = VendorRepository();

  Future<void> getVendorDetails() async {
    final resul = await vendorRepository.getVendorDetails();
    resul.fold((l) {
      emit(SplashFailed("emptyData".tr));
    }, (r) {
      if (r.data == null) {
        emit(SplashFailed("emptyData".tr));
      } else {
        Hive.box(HiveHelper.boxKeyVendorApp)
            .put(HiveHelper.boxKeyVendorApp, r.data?.toJson());
        emit(SplashSuccess(r.data!));
      }
    });
  }
}
