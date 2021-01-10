import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signIn/models/admin.dart';
import 'package:signIn/models/login_response.dart';

class FireBaseAuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

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
}
