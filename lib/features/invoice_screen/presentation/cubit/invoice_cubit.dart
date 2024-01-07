import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/features/invoice_screen/domain/invoice_repository.dart';
import 'package:meta/meta.dart';

import '../../../../common_utils/log_utils.dart';
import '../../data/invoice_entity.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceInitial());

  static InvoiceCubit get(context) => BlocProvider.of(context);


  InvoiceRepository invoiceRepository = InvoiceRepository();


  bool isRefresh = false;


  Future<void> getInvoice(String id) async {
    if (isRefresh==true) {
      emit(InvoiceLoading());
    }
    Log.e('id:2    $id');
    final resul = await invoiceRepository.getInvoice(id);

    resul.fold((l) {
      emit(InvoiceFailed("empty_data".tr));
    }, (r) {
      if (r.data == null) {
        emit(InvoiceFailed("empty_data".tr));
      }
      else {
        emit(InvoiceLoaded(r.data!));
      }
    });
  }

}
