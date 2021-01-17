part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess({@required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterFail extends RegisterState {
  final String message;
  RegisterFail({@required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterLoad extends RegisterState {}
