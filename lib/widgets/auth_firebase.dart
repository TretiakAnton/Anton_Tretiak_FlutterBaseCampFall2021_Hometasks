import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut({String email, String password}) async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    if (email.length < 5) {
      return 'too short email';
    } else if (password.length < 5) {
      return 'too short password';
    } else if (password.isEmpty || email.isEmpty) {
      return 'please enter your data again';
    } else {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        return 'Signed up';
      } on FirebaseAuthException catch (e) {
        return e.message;
      }
    }
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      Navigator.of(context).pushNamed('appScreen');
    } else {
      Navigator.of(context).pushNamed('registrationScreen');
    }
  }

  String checkUser({@required String email, @required String password}) {
    if (email.length < 5) {
      return 'too short email';
    } else if (password.length < 5) {
      return 'too short password';
    } else if (password.isEmpty || email.isEmpty) {
      return 'please enter your data again';
    } else {
      return 'all good';
    }
  }
}
