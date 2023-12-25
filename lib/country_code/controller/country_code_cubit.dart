import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../common_utils/common_utils.dart';
import '../data/country_code_entity.dart';
import '../domain/country_code_repository.dart';


part 'country_code_state.dart';

    class CountryCodeCubit extends Cubit<CountryCodeState> {
  CountryCodeCubit() : super(CountryCodeInitial());

  static CountryCodeCubit get(context) => BlocProvider.of(context);

  CountryCodeRepository countryCodeRepository = CountryCodeRepository();

  Future<void> getCountryCode() async {
    final resul = await countryCodeRepository.countryCode();
    resul.fold((l) {
      emit(CountryCodeFailed(l));
    }, (r) {
      if (r.data == null) {
        emit(CountryCodeFailed("emptyData".tr));
      } else {
        emit(CountryCodeSuccess(r.data!.rows!));
       CommonUtils.countryCodeList = r.data!.rows!;
      }
    });
  }

}
