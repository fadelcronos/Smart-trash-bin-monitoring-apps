part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterNewUser extends RegisterEvent {
  final Admin admin;

  RegisterNewUser({@required this.admin});

  @override
  List<Object> get props => [admin];
}
