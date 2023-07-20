import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/res/m_colors.dart';

import '../widgets/contact_us_form.dart';



class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen(
      {Key? key, required this.userName, required this.userEmail})
      : super(key: key);
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "contact".tr,
          style: const TextStyle(
            color: MColors.blueColor,
            fontWeight: FontWeight.w400,
            fontFamily: 'Tajawal',
          ),
        ),
        leading: IconButton(
          icon: HiveHelper.getAppLanguage()=='en'
              ? Image.asset(
            'assets/icons/back_icon.png',
            width: 28,
            height: 28,
          )
              : Image.asset(
            'assets/icons/profile_back.png',
            width: 18,
            height: 16,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ContactUsForm(userName: userName, userEmail: userEmail),
    );
  }
}
