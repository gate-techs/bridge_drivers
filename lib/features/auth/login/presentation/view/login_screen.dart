import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../main.dart';
import '../../../../../res/assets.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
import '../../../../../res/styles.dart';
import '../controller/login_cubit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final FocusNode _focus = FocusNode();
  final FocusNode _focus2 = FocusNode();
  bool passwordObscure = true;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();

    _focus2.removeListener(_onFocusChange);
    _focus2.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 24,
        title: Text(
          'welcomeBack'.tr,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: appFontFamily,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: const Color(0xff212121),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.vGap30,
              Lottie.asset(Assets.lottieLoginFirst, height: 250),
              Gaps.vGap30,
              BlocProvider(
                create: (context) => LoginCubit(),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final cubit = BlocProvider.of<LoginCubit>(context);
                    return Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MColors.veryLightGray,
                            ),
                            child: TextFormField(
                              controller: cubit.emailController,
                              cursorColor: MColors.colorPrimary,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff212121),
                              ),
                              decoration: MStyles.textFieldStyle(
                                  "email".tr,
                                  const Icon(
                                    Icons.mail_outline_outlined,
                                    color: Colors.grey,
                                  ),
                                  null),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "fieldRequired".trParams({
                                    "fieldName": "email".tr,
                                  });
                                } else if (!(value!.isEmail)) {
                                  return "fieldInValid".trParams({
                                    "fieldName": "email".tr,
                                  });
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Gaps.vGap16,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MColors.veryLightGray,
                            ),
                            child: TextFormField(
                              controller: cubit.passwordController,
                              obscureText: cubit.passwordObscure,
                              cursorColor: MColors.colorPrimary,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff212121),
                              ),
                              decoration: MStyles.textFieldStyle(
                                "password".tr,
                                const Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      cubit.updateTextObscure();
                                    },
                                    child: Icon(
                                      cubit.passwordObscure
                                          ? CupertinoIcons.eye
                                          : CupertinoIcons.eye_slash,
                                      color: MColors.colorPrimary,
                                    )),
                              ),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "fieldRequired".trParams({
                                    "fieldName": "password".tr,
                                  });
                                } else if (value!.length < 6) {
                                  return "fieldLower".trParams({
                                    "fieldName": "password".tr,
                                    "fieldCount": '6',
                                  });
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Gaps.vGap16,
                          InkWell(
                            onTap: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.doLoginApiCall();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: MColors.colorPrimary,
                                  borderRadius: BorderRadius.circular(66)),
                              child: Center(
                                child: Text(
                                  'login'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    shadows: [
                                      BoxShadow(
                                        color: MColors.colorPrimary,
                                        offset: const Offset(4, 8),
                                        blurRadius: 24,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gaps.vGap16,
                          // InkWell(
                          //   onTap: () {
                          //     Get.to(() => const ForgotPasswordScreen());
                          //     // CommonUtils.showMotionToastMessage(context, "مسا");
                          //   },
                          //   child: Text(
                          //     'forgotPassword'.tr,
                          //     style: TextStyle(
                          //       color: MColors.colorPrimary,
                          //       fontSize: 16,
                          //       fontFamily: appFontFamily,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          // ),

                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


