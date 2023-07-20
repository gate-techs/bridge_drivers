import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../donain/about_repository.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutInitial());

  static AboutCubit get(context) => BlocProvider.of(context);
  AboutRepository aboutRepository = AboutRepository();

  Future<void> about() async {
    final resul = await aboutRepository.about();
    resul.fold((l) {
      emit(AboutFailed('unknown_error'.tr));
    }, (r) async {
      if (r.data?.rows == null || r.data?.rows == '' ) {
        emit(AboutFailed("unknown_error".tr));
      } else {
        emit(AboutLoaded(r.data?.rows??''));
      }
    });
  }

}
