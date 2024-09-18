part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class Authloading extends AuthState {}

class AuthSucess extends AuthState {
  final BackendlessUser user;

  AuthSucess(this.user);
}

class AuthError extends AuthState {
  final Exception exception;

  AuthError(this.exception);
}
