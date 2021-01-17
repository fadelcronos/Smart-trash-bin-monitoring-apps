import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:signIn/models/admin.dart';
import 'package:signIn/screen/widget/register_form/bloc/register_bloc.dart';

import '../notif_snackbar.dart';

class RegisForm extends StatelessWidget {
  String _email, _pass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _handleRegister() {
      Admin admin = new Admin();
      final FormState = _formKey.currentState;

      FormState.save();

      admin.email = _email ?? '';
      admin.pass = _pass ?? '';
      BlocProvider.of<RegisterBloc>(context).add(RegisterNewUser(admin: admin));
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFail) {
          WidgetNotificationSnackbar().render(
            context: context,
            color: Colors.red,
            message: state.message,
          );
        }
        if (state is RegisterSuccess) {
          WidgetNotificationSnackbar().render(
            context: context,
            color: Color(0xff1b4332),
            message: state.message,
          );
        }
      },
      child: new Theme(
        data: new ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.red,
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              children: [
                TextFormField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    hintText: 'Type your email here...',
                    labelText: 'Email',
                    prefixIcon: const Icon(
                      Icons.mail_rounded,
                      color: Colors.white,
                    ),
                    prefixText: ' ',
                  ),
                  onSaved: (input) => _email = input,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    hintText: 'Type your password here...',
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    prefixText: ' ',
                  ),
                  obscureText: true,
                  onSaved: (input) => _pass = input,
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterLoad) {
                      return SpinKitFadingCube(color: Color(0xff1b4332));
                    }

                    return RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color(0xff1b4332),
                      onPressed: () => _handleRegister(),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
