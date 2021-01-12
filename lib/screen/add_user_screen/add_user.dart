import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New User"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Color(0xff1b4332),
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/img3.png',
          )
        ],
      ),
    );
  }
}
