import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // USER STREAM
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // SIGN IN ANONYMOUSLY
  Future signInAnonymously() async {
    try {
      UserCredential auth_result = await _auth.signInAnonymously();
      User? user = auth_result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
