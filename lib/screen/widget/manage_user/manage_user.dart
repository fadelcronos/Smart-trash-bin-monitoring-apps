import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signIn/models/admin.dart';
import 'package:signIn/screen/widget/edit_user/edit_user.dart';
import 'package:signIn/screen/widget/register_form/bloc/register_bloc.dart';
import 'package:signIn/screen/widget/register_form/register_form.dart';

import '../notif_snackbar.dart';

class ManageUser extends StatefulWidget {
  @override
  _ManageUserState createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  String _email, _pass;
  bool isEdit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    isEdit = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _handleRegister() {
      Admin admin = new Admin();
      // ignore: non_constant_identifier_names
      final FormState = _formKey.currentState;

      FormState.save();

      admin.email = _email ?? '';
      admin.pass = _pass ?? '';
      BlocProvider.of<RegisterBloc>(context).add(RegisterNewUser(admin: admin));
    }

    return SingleChildScrollView(
      child: new Theme(
        data: new ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.red,
        ),
        child: Column(
          children: [
            RaisedButton(
              color: Color(0xff1b4332),
              child: Text(
                isEdit ? 'Edit User' : 'Register User',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  isEdit = !isEdit;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            isEdit ? RegisForm() : EditUser(),
          ],
        ),
      ),
    );
  }
}
