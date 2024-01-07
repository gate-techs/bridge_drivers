import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/loading_widget.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../../../common_utils/log_utils.dart';
import '../../../main.dart';
import '../../../shared/error_widget.dart';
import 'cubit/invoice_cubit.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    Log.e('id:1    $id');
    return Scaffold(
      backgroundColor: MColors.screensBackgroundColor,
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          "Invoice".tr,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: appFontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () =>  Get.back(result: {'refresh': true}),
        ),
      ),
      body: BlocProvider(
        create: (context) => InvoiceCubit()..getInvoice(id),
        child: BlocConsumer<InvoiceCubit, InvoiceState>(
          listener: (context, state) {},
          builder: (context, state) {
            // InvoiceCubit invoiceCubit = context.read<InvoiceCubit>();
            if (state is InvoiceLoaded) {
              final data = state.invoiceData;
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
            backgroundColor: Colors.transparent,
            body: WebViewPlus(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: data.path,
            onWebViewCreated: (controller) {
            // controller.loadString(_controller.htmlScript);
            controller.webViewController.clearCache();
            },
            ),),);
            } else if (state is InvoiceFailed) {
              return FailedWidget(
                failedMessage: state.message,
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
    
  }
}
