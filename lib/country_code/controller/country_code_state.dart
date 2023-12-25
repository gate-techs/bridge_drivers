part of 'country_code_cubit.dart';


abstract class CountryCodeState {
  const CountryCodeState();
}

class CountryCodeInitial extends CountryCodeState {}



class CountryCodeSuccess extends CountryCodeState{
  final List<CountryCodeDataRows> countryCodeData;

  const CountryCodeSuccess(this.countryCodeData);
}


class CountryCodeFailed extends CountryCodeState {
  final String message;

  const CountryCodeFailed(this.message);
}
