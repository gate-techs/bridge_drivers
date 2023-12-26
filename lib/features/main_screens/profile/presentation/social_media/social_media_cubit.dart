
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../splash/data/vendor_entity.dart';
import '../../../../splash/domain/vendor_repository.dart';
part 'social_media_state.dart';

class SocialMediaCubit extends Cubit<SocialMediaState> {
  SocialMediaCubit() : super(SocialMediaInitial());

  static SocialMediaCubit get(BuildContext context) => BlocProvider.of(context);

  VendorRepository vendorRepository = VendorRepository();

  Future<void> getSocialLinks() async {
    emit(SocialMediaLoading());
    final resul = await vendorRepository.getVendorDetails();
    resul.fold((l) {
      emit(SocialMediaError());
    }, (r) async {
      emit(SocialMediaLoaded(r.data?.socialMedia));
    });
  }
}
