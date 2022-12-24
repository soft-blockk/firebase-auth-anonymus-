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

  // SIGN IN WITH EMAIL AND PASSWORD
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // REGISTER WITH EMAIL AND PASSWORD
  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  //SIGN OUT
  Future signOutFunction() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
