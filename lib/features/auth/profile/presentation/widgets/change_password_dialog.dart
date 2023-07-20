import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/res/styles.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog(
      {super.key, required this.onSubmitChangePasswordCallBack});

  final Function(String, String) onSubmitChangePasswordCallBack;

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    // TextEditingController oldPassController = TextEditingController();
    TextEditingController newPassController = TextEditingController();
    TextEditingController newPassConfirmController = TextEditingController();

    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: 350,
        height: 450,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(30),
                      ),
                      color: MColors.greenColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/background/bottom_right.png",
                  width: 300,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/password_image.png",
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "change_password".tr,
                      style: const TextStyle(
                        color: MColors.blueColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Padding(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 20, vertical: 4),
                    //     child: TextFormField(
                    //       controller: oldPassController,
                    //       obscureText: true,
                    //       textInputAction: TextInputAction.next,
                    //       decoration: MStyles.suffixInputDecoration(
                    //           "old_password".tr, "assets/svg/ic_lock.svg"),
                    //       validator: (value) {
                    //         if (value != null && value.isEmpty) {
                    //           return "fieldRequired".trParams({
                    //             "fieldName": "old_password".tr,
                    //           });
                    //         } else if (value!.length < 8) {
                    //           return "fieldLower".trParams({
                    //             "fieldName": "old_password".tr,
                    //             "fieldCount": '8',
                    //           });
                    //         } else {
                    //           return null;
                    //         }
                    //       },
                    //     )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        child: TextFormField(
                          controller: newPassController,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          decoration: MStyles.textFieldDecoration(
                              "password".tr, "assets/svg/ic_lock.svg"),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "fieldRequired".trParams({
                                "fieldName": "password".tr,
                              });
                            } else if (value!.length < 8) {
                              return "fieldLower".trParams({
                                "fieldName": "password".tr,
                                "fieldCount": '8',
                              });
                            } else {
                              return null;
                            }
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 4),
                      child: TextFormField(
                        controller: newPassConfirmController,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        decoration: MStyles.textFieldDecoration(
                            "confirm_password".tr,
                            "assets/svg/ic_lock.svg"),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "fieldRequired".trParams({
                              "fieldName": "confirm_password".tr,
                            });
                          } else if (value!.length < 8) {
                            return "fieldLower".trParams({
                              "fieldName": "confirm_password".tr,
                              "fieldCount": '8',
                            });
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
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
                            if (formKey.currentState!.validate()) {
                              if (newPassConfirmController.text !=
                                  newPassConfirmController.text) {
                                CommonUtils.showToastMessage(
                                    'password_match'.tr);
                              } else {
                                widget.onSubmitChangePasswordCallBack.call(
                                  // oldPassController.text,
                                    newPassController.text,
                                    newPassConfirmController.text);
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: Text(
                            "submit".tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
