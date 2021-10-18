import 'package:book_app/Core/Enums/loading.dart';
import 'package:book_app/Core/Exceptions/firebase_exceptions.dart';
import 'package:book_app/Utils/app_utils.dart';
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
        _setLoading(false);
      });
    } on FirebaseAuthException catch (e) {
      AppUtils.showToast(
          message: FirebaseAuthExceptions.getMessageFromErrorCode(e));
      _setLoading(false);
      //throw e;
    }
    _setLoading(false);
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

  Future<String?> signIn({String? email, String? password}) async {
    _setLoading(true);
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      _setLoading(false);
      return AppUtils.showToast(message: "Signed in");
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      AppUtils.showToast(
          message: FirebaseAuthExceptions.getMessageFromErrorCode(e));
      return e.message;
    }
  }

  Future<String?> signUp({String? email, String? password}) async {
    _setLoading(true);
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      return AppUtils.showToast(message: "Signed Up");
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      AppUtils.showToast(
          message: FirebaseAuthExceptions.getMessageFromErrorCode(e));
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
