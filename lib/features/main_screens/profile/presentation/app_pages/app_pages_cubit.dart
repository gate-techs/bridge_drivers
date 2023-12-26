import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/app_pages_entity.dart';
import '../../domain/profile_repository.dart';



part 'app_pages_state.dart';

class AppPagesCubit extends Cubit<AppPagesState> {
  AppPagesCubit() : super(AppPagesInitial());

  static AppPagesCubit get(BuildContext context) => BlocProvider.of(context);

  ProfileRepository profileRepository = ProfileRepository();

  Future<void> getAppPages() async {
    emit(AppPagesLoading());
    final resul = await profileRepository.getAppPagesApiCall();
    resul.fold((l) {
      emit(AppPagesError());
    }, (r) async {
      emit(AppPagesLoaded(r));
    });
  }
}
