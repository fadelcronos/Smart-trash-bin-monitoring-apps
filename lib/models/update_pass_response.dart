import 'package:firebase_auth/firebase_auth.dart';

class UpdateResponse {
  final User user;
  final String message;

  UpdateResponse({this.user, this.message});
}
