import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../data/about_entity.dart';
import '../../domain/about_repository.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutInitial());
  static AboutCubit get(context)=> BlocProvider.of(context);

  AboutRepository aboutRepository = AboutRepository();
  Future<void> getAbout(String page)async{
    final resul = await aboutRepository.getAbout(page);
    resul.fold((l) {
      emit(const AboutFailed('Error : No Data'));
    }, (r) {
      if(r.data==null) {
        emit( AboutFailed("empty_data".tr));
      }
      else{
        emit(AboutSuccess(r.data!));
      }
    }
    );
  }
}
