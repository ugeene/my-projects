import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:interf/util/firebase_listenter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseGoogleUtil {
  static final FirebaseGoogleUtil _instance = new FirebaseGoogleUtil.internal();
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuthListener _view;

  FirebaseGoogleUtil.internal();

  factory FirebaseGoogleUtil() {
    return _instance;
  }

  setScreenListener(FirebaseAuthListener view) {
    _view = view;
  }

//  Future<void> signInWithGoogle() async {
//    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//    FirebaseUser user = await _auth.signInWithGoogle(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
  Future signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    //return user;
    print("signed in " + user.displayName);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();

    if (!identical(user.uid, currentUser.uid)) {
      onLoginUserVerified(currentUser);
    } else {
      onTokenError(user.toString());
    }
  }

  void onLoginUserVerified(FirebaseUser currentUser) {
    _view.onLoginUserVerified(currentUser);
  }

  onTokenError(String string) {
    _view.onError(string);
  }
}

//imported a new code and changed the signInWithGoogle future function