import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/validators.dart';
 import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/res/styles.dart';
import 'package:kishk_driver/shared/widgets/error_dialog.dart';

import '../../../../shared/widgets/action_dialog.dart';
import '../controller/contact_us_cubit.dart';

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({Key? key, required this.userName, required this.userEmail})
      : super(key: key);
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocProvider<ContactUsCubit>(
        create: (context) => ContactUsCubit(),
        child: BlocConsumer<ContactUsCubit, ContactUsState>(
            listener: (context, ContactUsState state) {
          if (state is ContactUsSuccess) {
            showDialog(
                context: context,
                builder: (ctx) => ActionDialog(
                      message: "message_sent".tr,
                    ));
          } else if (state is ContactUsFailed) {
            showDialog(
                context: context,
                builder: (ctx) => ErrorDialog(errorMessage: state.message));
          }
        }, builder: (BuildContext context, ContactUsState state) {
          ContactUsCubit contactUsCubit = ContactUsCubit().get(context);
          contactUsCubit.email.text = userEmail;
          return SingleChildScrollView(
            child: Form(
              key: contactUsCubit.form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/contact_image.png",
                    height: 200,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "glad_to_hear".tr,
                    style: const TextStyle(
                        color: MColors.blueColor,
                        fontWeight: FontWeight.bold,
                         fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "hear_from".tr,
                    style: const TextStyle(
                        color: MColors.blueColor, ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 12.0, right: 12.0),
                    child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: contactUsCubit.email,
                          decoration: MStyles.textFieldDecoration("email".tr),
                          validator: (value) => value!.isEmpty
                              ? "empty_email".tr
                              : isValidEmail(context, userEmail),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 7, left: 12.0, right: 12.0),
                    child: SizedBox(
                      height: (6 * 24.0),
                      child: TextFormField(
                        maxLines: 6,
                        controller: contactUsCubit.message,
                        decoration:
                            MStyles.textFieldDecoration("your_message".tr),
                        validator: (value) =>
                            value!.isEmpty ? "enter_message".tr : null,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 40,
                        width: 120,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MColors.greenColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          onPressed: () {
                            contactUsCubit.contactUs({
                              "name": userName,
                              "email": contactUsCubit.email.text,
                              "message": contactUsCubit.message.text
                            });
                          },
                          child: Text(
                            "send".tr,
                            style: const TextStyle(
                                color: Colors.white, ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    ));
  }
}
