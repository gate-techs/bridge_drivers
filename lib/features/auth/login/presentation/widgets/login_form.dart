import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/common_utils/validators.dart';
import 'package:kishk_driver/res/gaps.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/res/styles.dart';
import 'package:kishk_driver/shared/widgets/bottom_bar_screen.dart';
import 'package:kishk_driver/shared/widgets/error_dialog.dart';
import 'package:kishk_driver/shared/widgets/loading_dialog.dart';

import '../controller/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is LoginInitial) {
            showDialog(
                context: context, builder: (ctx) => const LoadingDialog());
          } else if (state is LoginSuccess) {
            Get.offAll(() => const BottomBarScreen());
          } else if (state is LoginFailed) {
            showDialog(
                context: context,
                builder: (ctx) => ErrorDialog(errorMessage: state.message));
          }
        },
        builder: (BuildContext context, LoginState state) {
          LoginCubit mLoginCubit = LoginCubit().get(context);

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: mLoginCubit.form,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo.png",
                          height: size.height * .4, fit: BoxFit.cover),

                      Text(
                        "welcome_back".tr,
                        style: const TextStyle(
                          color: MColors.moveColor,
                          fontSize: 20,
                        ),
                      ),
                      Gaps.vGap16,
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            validator: (value) =>
                                isValidEmail(context, value ?? ''),
                            decoration: MStyles.textFieldDecoration(
                                "user_name".tr, "assets/svg/ic_active_profile.svg"),
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(mLoginCubit.passwordFocusNode),
                            onChanged: (value) => mLoginCubit.email = value,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            validator: (value) =>
                                isValidPassword(context, value ?? ''),
                            obscureText: true,
                            maxLines: 1,
                            focusNode: mLoginCubit.passwordFocusNode,
                            decoration: MStyles.textFieldDecoration(
                                "password".tr, "assets/svg/ic_lock.svg"),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                              mLoginCubit.login({
                                'email': mLoginCubit.email,
                                'password': mLoginCubit.password,
                              });
                            },
                            onChanged: (value) => mLoginCubit.password = value,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 42,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                mLoginCubit.login({
                                  'email': mLoginCubit.email,
                                  'password': mLoginCubit.password,
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          MColors.greenColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ))),
                              child: Text(
                                "login".tr,
                                style: const TextStyle(
                                  height: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
