import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../data/contact_us_entity.dart';
import '../../domain/contact_us_repository.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  ContactUsCubit get(context) => BlocProvider.of(context);

  ContactUsRepository contactUsRepository = ContactUsRepository();

  final form = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  bool isLoading = false;


  Future<void> contactUs(Map<String, dynamic> params) async {
    EasyLoading.show(status: 'loading'.tr);
    final resul = await contactUsRepository.contactUs(params);
    resul.fold((l) {
      EasyLoading.dismiss();
      emit(ContactUsFailed(l.message??'unknown_error'.tr));
    }, (r) async {
      EasyLoading.dismiss();
      emit(ContactUsSuccess(r.data!));
    });
  }
}
