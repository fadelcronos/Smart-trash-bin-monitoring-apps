import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:signIn/models/admin.dart';
import 'package:signIn/screen/homepage_screen/homepage.dart';
import 'package:signIn/screen/login_screen/bloc/login_bloc.dart';
import 'package:signIn/screen/widget/notif_snackbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _pass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/img2.jpg'), fit: BoxFit.fill),
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFail) {
              WidgetNotificationSnackbar().render(
                context: context,
                color: Colors.red,
                message: state.message,
              );
            }
            if (state is LoginSuccess) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                alignment: Alignment.center,
                margin: EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Card(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/img1.png',
                            height: 150.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "SMART TRASH BIN",
                              style: TextStyle(color: Colors.green, fontSize: 20),
                            ),
                          ),
                          TextFormField(
                            // ignore: missing_return
                            focusNode: myFocusNode,
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
                                color: Colors.green,
                              ),
                            ),
                          ),
                          TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Please type a password';
                              } else if (input.length < 6) {
                                return 'The password must be 6 character';
                              }
                            },
                            onSaved: (input) => _pass = input,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.green,
                                )),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoad) {
                                return SpinKitFadingCube(color: Colors.green);
                              }

                              return RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                color: Color(0xff43a047),
                                onPressed: () => _handleLogin(),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
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
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _handleLogin() {
    Admin admin = new Admin();
    final FormState = _formKey.currentState;

    FormState.save();

    admin.email = _email ?? '';
    admin.pass = _pass ?? '';
    BlocProvider.of<LoginBloc>(context).add(LoginAdminWithUsername(admin: admin));
  }

  // ignore: non_constant_identifier_names
  // Future<void> SignIn() async {
  //   // ignore: non_constant_identifier_names
  //   await Firebase.initializeApp();

  //   final FormState = _formKey.currentState;
  //   if (FormState.validate()) {
  //     FormState.save();
  //     try {
  //       // ignore: unused_local_variable
  //       final User user = (await FirebaseAuth.instance
  //               .signInWithEmailAndPassword(email: _email, password: _pass))
  //           .user;
  //       print('sucess');
  //     } catch (e) {
  //       print(e.message.toString());
  //     }
  //   }
  // }
}
