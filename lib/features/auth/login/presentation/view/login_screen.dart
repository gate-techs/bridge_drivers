import 'package:flutter/material.dart';

import '../widgets/login_form.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName = "/home_route_name";

  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SafeArea(
        child: LoginForm(),
      ),
    );
  }

}


