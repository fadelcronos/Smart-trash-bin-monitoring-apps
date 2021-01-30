import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signIn/screen/login_screen/signin.dart';
import 'package:signIn/screen/widget/datagrid.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String roles;
  HomePage({this.email, this.roles});
  // ignore: deprecated_member_use

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b4332),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 16, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.email,
                      style: GoogleFonts.raleway(textStyle: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.roles,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: signOut,
                )
              ],
            ),
          ),
          GridDashboard(
            roles: widget.roles,
          ),
        ],
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return LoginPage();
      },
    ));
  }
}
