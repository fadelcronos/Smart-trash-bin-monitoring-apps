import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signIn/models/admin.dart';
import 'package:signIn/models/register_response.dart';
import 'package:signIn/services/firebase_auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterNewUser) {
      yield* _mapRegisterNewUser(event);
    }
  }

  Stream<RegisterState> _mapRegisterNewUser(RegisterNewUser event) async* {
    yield RegisterLoad();

    try {
      RegisterResponse regisResponse = await registerAdmin(event.admin);
      print(regisResponse.message);
      if (regisResponse.message.toLowerCase() == 'register success') {
        yield RegisterSuccess();
      } else {
        yield RegisterFail(
          message: regisResponse.message.replaceAll(new RegExp(r'[\(\[].*?[\)\]]'), ''),
        );
      }
    } catch (e) {
      if (e.code == 'wrong-password') {
        print("PW SALAH COK");
      }
      yield RegisterFail(message: 'Register Fail');
    }
  }
}

Future<RegisterResponse> registerAdmin(Admin admin) async {
  try {
    RegisterResponse regisResponse = await FireBaseAuthService.registerUser(admin: admin);
    if (regisResponse.user != null) {
      return RegisterResponse(message: 'Register Success', user: regisResponse.user);
    } else {
      return RegisterResponse(message: regisResponse.message);
    }
  } on PlatformException catch (e) {
    print(e.toString());
    return RegisterResponse(message: e.toString());
  }
}
