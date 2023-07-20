part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState {
  const ContactUsState();
}

class ContactUsInitial extends ContactUsState {}

class ContactUsSuccess extends ContactUsState{
  final ContactUsData data;
  const  ContactUsSuccess(this.data);
}


class ContactUsFailed extends ContactUsState {
  final String message;
  const ContactUsFailed(this.message);
}