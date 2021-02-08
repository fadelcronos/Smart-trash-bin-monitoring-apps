import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signIn/screen/login_screen/signin.dart';
import 'package:signIn/screen/widget/datagrid.dart';
import 'package:signIn/screen/widget/notif_snackbar.dart';
import 'package:signIn/services/firebase_auth.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String roles;
  HomePage({this.email, this.roles});
  // ignore: deprecated_member_use

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _pass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Container(
                              height: 400.0,
                              width: 360.0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.user,
                                            color: Colors.green,
                                            size: 60,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            enabled: false,
                                            decoration: new InputDecoration(
                                              border: new OutlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.teal),
                                                borderRadius: new BorderRadius.circular(25.0),
                                              ),
                                              hintText: 'Type your email here...',
                                              labelText: widget.email,
                                              prefixIcon: const Icon(
                                                Icons.mail_rounded,
                                                color: Colors.green,
                                              ),
                                              prefixText: ' ',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            decoration: new InputDecoration(
                                              border: new OutlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.teal),
                                                borderRadius: new BorderRadius.circular(25.0),
                                              ),
                                              hintText: 'Input new Password',
                                              labelText: 'Password',
                                              prefixIcon: const Icon(
                                                Icons.lock,
                                                color: Colors.green,
                                              ),
                                              prefixText: ' ',
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'please enter new password';
                                              }
                                              return null;
                                            },
                                            obscureText: true,
                                            onSaved: (input) => _pass = input,
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          RaisedButton(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            color: Colors.green,
                                            onPressed: () {
                                              if (_formKey.currentState.validate()) {
                                                updatePw();
                                              } else {
                                                Scaffold.of(context).showSnackBar(SnackBar(
                                                  content: Text('Processing Data'),
                                                ));
                                              }
                                            },
                                            child: Text(
                                              "Update Password",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          RaisedButton(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            color: Colors.red,
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return Dialog(
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                                      elevation: 16,
                                                      child: Container(
                                                        height: 200.0,
                                                        width: 200.0,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    'Are you sure want to delete this account ?',
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                    ),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      RaisedButton(
                                                                        color: Colors.green,
                                                                        onPressed: delAcc,
                                                                        child: Text(
                                                                          'Yes',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 15,
                                                                      ),
                                                                      RaisedButton(
                                                                        color: Colors.red,
                                                                        onPressed: () => Navigator.pop(context),
                                                                        child: Text(
                                                                          'No',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Text(
                                              "Delete Account",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
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

  Future<void> delAcc() async {
    var user = await FirebaseAuth.instance.currentUser;

    // if (acc.delete() != null) {
    //   print('Account Deleted!');
    // } else {
    //   print('Error');
    // }
    user.delete().then((_) {
      print("Account Delete success");
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      Navigator.pop(context);
      showAlertDialog(context, 'Oops!, Something went wrong, Can not delete this account', 'Dismissed');
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  Future<void> updatePw() async {
    final FormState = _formKey.currentState;
    FormState.save();
    User user = await FirebaseAuth.instance.currentUser;
    user.updatePassword(_pass).then((_) {
      print("Successfully changed password");
      Navigator.pop(context);
      showAlertDialog(context, 'Password Updated', 'Ok');
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      Navigator.pop(context);
      showAlertDialog(context, 'Oops!, Something went wrong, Please Re-login', 'Dismissed');
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }
}

showAlertDialog(BuildContext context, String message, String btnTxt) {
  Widget launchButton = FlatButton(
    child: Text(btnTxt),
    onPressed: () => Navigator.pop(context),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notification"),
    content: Text(message),
    actions: [
      launchButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
