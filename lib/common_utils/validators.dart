import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


final RegExp _emailRegExp = RegExp(
  r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
);

String? isValidEmail(BuildContext context, String email) {
  if (email.trim().isEmpty) return "email".tr;
  return _emailRegExp.hasMatch(email.trim())
      ? null
      : "invalid_email".tr;
}

String? isValidName(BuildContext context, String value) {
  return value.isNotEmpty ? null : "empty_name".tr;
}

String? isValidPhone(BuildContext context, String phone) {
  //Todo change the length validation later
  return phone.isNotEmpty ? null : "empty_phone".tr;
}

String? confirmPassword(
    BuildContext context, String password, String confirmedPassword) {
  if (confirmedPassword.isEmpty) return  "empty_password".tr;
  return password == confirmedPassword
      ? null
      : "password_match".tr;
}

String? isValidPassword(BuildContext context, String password) {
  if (password.isEmpty) return "empty_password".tr;
  return password.length >= 6 ? null : "short_password".tr;
}
