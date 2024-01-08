import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/loading_widget.dart';
import '../../../main.dart';
import '../../../shared/error_widget.dart';
import 'cubit/invoice_cubit.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';


class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceCubit()..getInvoice(id),
      child: BlocConsumer<InvoiceCubit, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          InvoiceCubit invoiceCubit = context.read<InvoiceCubit>();
          if (state is InvoiceLoaded) {
            final data = state.invoiceData;
            return  Scaffold(
              backgroundColor: MColors.screensBackgroundColor,
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Text(
                  "printReceipt".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: appFontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: (){
                      invoiceCubit.printPdfFromUrl(data.path??'');
                    },
                icon: const Icon(TablerIcons.printer,color: Colors.black,)),
                  IconButton(
                      onPressed: (){
                        invoiceCubit.shareInvoice(data.path??'');
                      },
                      icon: const Icon(TablerIcons.share,color: Colors.black,)),
                ],
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () =>  Get.back(result: {'refresh': true}),
                ),
              ),
              body:PDFViewer(document:invoiceCubit.document,showPicker: false,progressIndicator: const LoadingWidget(),),
            );
          } else if (state is InvoiceFailed) {
            return FailedWidget(
              failedMessage: state.message,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );

  }
}
