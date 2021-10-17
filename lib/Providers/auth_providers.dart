import 'package:book_app/Core/Enums/loading.dart';
import 'package:book_app/Core/Exceptions/firebase_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {
  LoadingState _loadingState = LoadingState.idle;
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  LoadingState get loadingState => _loadingState;
  AuthenticationProvider(this.firebaseAuth);

  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<String?> signInwithGoogle() async {
    _setLoading(true);
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(credential).then((value) {
        if (value == null) _setLoading(false);
      });
    } on FirebaseAuthException catch (e) {
      FirebaseAuthExceptions.getMessageFromErrorCode(e);
      _setLoading(false);
      //throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

  Future<String?> signIn({String? email, String? password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp({String? email, String? password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signInAnonymously() async {
    _setLoading(true);
    firebaseAuth.signInAnonymously().then((result) {
      authState;

      _setLoading(false);
    });
  }

  Future<String?> uid() async {
    return firebaseAuth.currentUser!.uid;
  }

  _setLoading(bool state) {
    if (state == true)
      _loadingState = LoadingState.busy;
    else
      _loadingState = LoadingState.idle;
    notifyListeners();
  }
}
