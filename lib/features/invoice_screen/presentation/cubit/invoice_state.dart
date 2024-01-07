part of 'invoice_cubit.dart';

@immutable
abstract class InvoiceState {
  const InvoiceState();
}

class InvoiceInitial extends InvoiceState {}
class InvoiceLoading extends InvoiceState {}

class InvoiceLoaded extends InvoiceState{
  final InvoiceData invoiceData;

  const InvoiceLoaded(this.invoiceData);
}


class InvoiceFailed extends InvoiceState {
  final String message;

  const InvoiceFailed(this.message);
}