part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthRegister extends AuthEvent {
  final String email;
  final String name;
  final String password;
  final String phoneNumber;

  AuthRegister(
      {required this.email, required this.password, required this.phoneNumber,required this.name});
}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;
  final bool remember;

  AuthLogin({required this.email, required this.password,required this.remember});
}

class AuthStarted extends AuthEvent {}
