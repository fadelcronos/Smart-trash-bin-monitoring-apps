import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signIn/models/admin.dart';
import 'package:signIn/models/login_response.dart';
import 'package:signIn/services/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginAdminWithUsername) {
      yield* _mapLoginAdminWithUsername(event);
    }
  }

  Stream<LoginState> _mapLoginAdminWithUsername(LoginAdminWithUsername event) async* {
    yield LoginLoad();

    try {
      SignInResponse signInResponse = await signInAdmin(event.admin);
      print(signInResponse.message);
      if (signInResponse.message.toLowerCase() == 'login success') {
        yield LoginSuccess();
      } else {
        yield LoginFail(
          message: signInResponse.message.replaceAll(new RegExp(r'[\(\[].*?[\)\]]'), ''),
        );
      }
    } catch (e) {
      if (e.code == 'wrong-password') {
        print("=========================");
        print("PW SALAH COK");
        print("=========================");
      }
      yield LoginFail(message: 'Login Fail');
    }
  }
}

Future<SignInResponse> signInAdmin(Admin admin) async {
  try {
    SignInResponse signInResponse = await FireBaseAuthService.signInWithEmail(admin: admin);
    if (signInResponse.user != null) {
      return SignInResponse(message: 'Login Success', user: signInResponse.user);
    } else {
      return SignInResponse(message: signInResponse.message);
    }
  } on PlatformException catch (e) {
    print(e.toString());
    return SignInResponse(message: e.toString());
  }
}
