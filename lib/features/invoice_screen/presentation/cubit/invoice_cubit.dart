import 'dart:io';
import 'dart:typed_data';

import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'package:kishk_driver/features/invoice_screen/domain/invoice_repository.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../common_utils/log_utils.dart';
import '../../data/invoice_entity.dart';
part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceInitial());

  static InvoiceCubit get(context) => BlocProvider.of(context);


  InvoiceRepository invoiceRepository = InvoiceRepository();


   bool isRefresh = false;
   late  PDFDocument document ;


  Future<void> getInvoice(String id) async {
    if (isRefresh==true) {
      emit(InvoiceLoading());
    }
    Log.e('id:2    $id');
    final resul = await invoiceRepository.getInvoice(id);

    resul.fold((l) {
      emit(InvoiceFailed("empty_data".tr));
    }, (r) async {
      if (r.data == null) {
        emit(InvoiceFailed("empty_data".tr));
      }
      else {

        final doc = await PDFDocument.fromURL(r.data?.path??'');
        document = doc;
        emit(InvoiceLoaded(r.data!));
      }
    });
  }

  Future<void> printPdfFromUrl(String pdfUrl) async {
    try {
      await Printing.layoutPdf (
        onLayout: (_) => Future.value(  convertPdfToUint8List(pdfUrl)),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

 shareInvoice(String pdfUrl) async {
   final Directory tempDir = await getTemporaryDirectory();
   final File pdfFile = File('${tempDir.path}/$pdfUrl');
   Share.shareFiles([pdfFile.path], );
  }

  Future<void> shareUint8List(String pdfUrl) async {
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile = File('${tempDir.path}/Bridge Invoice.pdf');

    await tempFile.writeAsBytes(await convertPdfToUint8List(pdfUrl));

    if (await tempFile.exists()) {
      Share.shareFiles([tempFile.path], text: 'Sharing PDF file');
    } else {
      print('Failed to create temporary file');
    }
  }

  Future<Uint8List> convertPdfToUint8List(String pdfUrl) async {
    try {
      final http.Response response = await http.get(Uri.parse(pdfUrl));

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.bodyBytes);
      } else {
        throw Exception('Failed to download PDF from the URL');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to convert PDF to Uint8List');
    }
  }
}
