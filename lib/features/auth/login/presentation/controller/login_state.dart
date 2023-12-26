part of 'login_cubit.dart';

@immutable


abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}


class LoginSuccess extends LoginState{
  final AuthDataEntity loginData;

  const  LoginSuccess(this.loginData);
}


class LoginFailed extends LoginState {
  final String message;


  const LoginFailed(this.message);
}
