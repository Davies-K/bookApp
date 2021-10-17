import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthenticationProvider(this.firebaseAuth);

  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
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
    firebaseAuth.signInAnonymously().then((result) {
      authState;
    });
  }

  Future<String?> uid() async {
    return firebaseAuth.currentUser!.uid;
  }
}
