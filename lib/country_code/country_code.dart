
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../common_utils/common_utils.dart';
import '../common_utils/image_utils.dart';
import '../res/m_colors.dart';
import '../res/styles.dart';

class CountryCode extends StatefulWidget {
  final Function(PhoneNumber, TextEditingController) onChangedCallBack;
  final PhoneNumber? phoneNumber;
  final bool? isClickable;


  const CountryCode(
      {super.key,
      required this.onChangedCallBack,
      this.phoneNumber,
      required this.isClickable});

  @override
  State<CountryCode> createState() => CountryCodeState();
}

class CountryCodeState extends State<CountryCode> {
  PhoneNumber? number;
  String? initialIsoCode = "KW";
  TextEditingController phoneEditingController = TextEditingController();

  @override
  void initState() {
    number = widget.phoneNumber ?? PhoneNumber(isoCode: 'KW');
    phoneEditingController.text = widget.phoneNumber?.phoneNumber ?? '';
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
         ),
      child: AbsorbPointer(
        absorbing: widget.isClickable ?? true,
        child: InternationalPhoneNumberInput(
          validator: (value) => value!.isEmpty ? 'thisFieldRequired'.tr:null,
          countries: CommonUtils.countryCodeList?.map<String>((e) => e.isoCode ?? 'KW').toList(),
          locale: Get.locale?.languageCode ?? 'en',
          onInputChanged: (PhoneNumber value) {
            number = value;
            initialIsoCode = value.isoCode;
            widget.onChangedCallBack.call(value, phoneEditingController);
          },
          selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              setSelectorButtonAsPrefixIcon: false,
              trailingSpace: false,
              useEmoji: false),
          initialValue: PhoneNumber(isoCode: number?.isoCode ?? initialIsoCode),
          textAlign: (Get.locale?.languageCode ?? 'ar') == 'ar'
              ? TextAlign.end
              : TextAlign.start,
          ignoreBlank: false,
          hintText: 'mobile'.tr,
          textFieldController: phoneEditingController,
          cursorColor: MColors.colorPrimary,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(color: Colors.black),
          formatInput: false,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          inputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:  BorderSide(
                color: MColors.colorPrimary, width: 1.0),
          ),
          searchBoxDecoration: MStyles.textFieldStyle("searchCountryCode".tr,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  width: 24,
                  height: 24,
                  ImageUtils.getAssetsPath('ic_search', 'svg',
                      format: 'svg'),
                ),
              ),null),
          inputDecoration:  MStyles.textFieldStyle("phone".tr,
              null,null),
        ),
      ),
    );
  }
}
