part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String email;
  final String roles;

  LoginSuccess({@required this.email, this.roles});
}

class LoginFail extends LoginState {
  final String message;
  LoginFail({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoginLoad extends LoginState {}
