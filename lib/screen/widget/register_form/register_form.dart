import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signIn/screen/widget/register_form/bloc/register_bloc.dart';

class RegisForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _email;
    String _pass;
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        // if (state is LoginFailure) {
        //   WidgetNotificationSnackbar().render(
        //     context: context,
        //     color: redColor,
        //     message: state.message,
        //   );
        // }
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please type an email';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
