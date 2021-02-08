import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signIn/models/admin.dart';
import 'package:signIn/models/login_response.dart';
import 'package:signIn/models/register_response.dart';
import 'package:signIn/models/update_pass_response.dart';

class FireBaseAuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseAuth _regis = FirebaseAuth.instance;

  static Future<SignInResponse> signInWithEmail({Admin admin}) async {
    await Firebase.initializeApp();

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: admin.email,
        password: admin.pass,
      );
      return SignInResponse(user: userCredential.user);
    } catch (e) {
      return SignInResponse(message: e.toString());
    }
  }

  static Future<RegisterResponse> registerUser({Admin admin}) async {
    await Firebase.initializeApp();
    try {
      UserCredential cred = await _regis.createUserWithEmailAndPassword(
        email: admin.email,
        password: admin.pass,
      );
      return RegisterResponse(user: cred.user);
    } catch (e) {
      return RegisterResponse(message: e.toString());
    }
  }

  static Future<UpdateResponse> updatePass({Admin admin}) async {
    await Firebase.initializeApp();
    try {
      User cred = await _regis.currentUser;
      cred.updatePassword(admin.pass);
      return UpdateResponse();
    } catch (e) {
      return UpdateResponse(message: e.toString());
    }
  }
}
